class Certificado < ActiveRecord::Base
  self.per_page = 15

  attr_accessor :coleccion_coladas

  scope :viejo, -> { where( 'fecha_recepcion <= ?', Date.today - 1.year) }

  belongs_to :proveedor
  belongs_to :sucursal
  has_many   :coladas, inverse_of: :certificado, dependent: :destroy
  accepts_nested_attributes_for :coladas, reject_if: lambda { |a| a[:numero].blank? }, allow_destroy: true
  #validates_associated :coladas

  DIRECTORIO_CERTIFICADOS_SYSTEM = ':rails_root/public/certificados'
  DIR_CERTIFICADOS = '/certificados'

  has_attached_file :adjunto, { path: "#{DIRECTORIO_CERTIFICADOS_SYSTEM}/:sucursal/:system_id.:extension",
                                url: "#{DIR_CERTIFICADOS}/:sucursal/:system_id.:extension",
                                use_timestamp: false }

  validates_attachment_content_type :adjunto, :content_type => /(\Aapplication\/pdf\Z)|\Aimage\/jpeg\Z/

  validate :fecha_recepcion_is_date?

  validates :proveedor,
            :sucursal,
            :adjunto,
            presence: true

  validates :system_id, uniqueness: true

  ALPHANUMERIC_REGEX = /\A[-a-zA-Z0-9]*\z/
  validates :numero_certificado,
            :numero_guia_proveedor,
            :numero_codigo_producto,
            format: { with: ALPHANUMERIC_REGEX }

  validates :numero_certificado, presence: true


  NUMERIC_REGEX = /\A[0-9]*\z/
  validates :numero_orden_compra, format: { with: NUMERIC_REGEX }

  validates :numero_certificado,
            :numero_guia_proveedor,
            :numero_codigo_producto,
            :numero_orden_compra,
            length: { maximum: 32 }

  validate :coleccion_coladas_unicas

  def coleccion_coladas_unicas
    if coleccion_coladas.uniq.size != coleccion_coladas.size
      errors.add(:base, 'Número de coladas repetidas')
    end
  end

  def self.search(search)
    query = {}
    unless search[:n_certificado].blank?
      query[:n_certificado] = {clause: 'numero_certificado LIKE ?', parameter: search[:n_certificado]}
    end

    unless search[:n_guia_proveedor].blank?
      query[:n_guia_proveedor] = {clause: 'numero_guia_proveedor LIKE ?', parameter: search[:n_guia_proveedor]}
    end

    unless search[:n_codigo_producto].blank?
      query[:n_producto] = {clause: 'numero_codigo_producto LIKE ?', parameter: search[:n_codigo_producto]}
    end

    unless search[:n_colada].blank?
      query[:n_colada] = {clause: 'coladas.numero LIKE ?', parameter: search[:n_colada]}
    end

    unless search[:n_orden_compra].blank?
      query[:n_orden_compra] = {clause: 'numero_orden_compra LIKE ?', parameter: search[:n_orden_compra]}
    end

    unless search[:start_date].blank?
      d, m, y = search[:start_date].split /\/|-/
      if Date.valid_date? y.to_i, m.to_i, d.to_i
        query[:start_date] = {clause: 'fecha_recepcion >= ?', parameter: search[:start_date].to_date}
      end
    end

    unless search[:end_date].blank?
      d, m, y = search[:start_date].split /\/|-/
      puts d, m, y
      if Date.valid_date? y.to_i, m.to_i, d.to_i
        query[:end_date] = {clause: 'fecha_recepcion <= ?', parameter: search[:end_date].to_date + 23.hour + 59.second}
      end
    end

    unless search[:sucursal_id].blank?
      query[:sucursal_id] = {clause: 'sucursal_id = ?', parameter: search[:sucursal_id].to_i }
    end

    unless search[:proveedor_id].blank?
      query[:proveedor_id] = {clause: 'proveedor_id = ?', parameter: search[:proveedor_id].to_i }
    end

    #puts query.collect {|key, value| value[:parameter]}
    conditions = query.collect {|_, value| value[:parameter]}
    if query.empty?
      all
    else
      joins(:coladas).where(query.collect {|_, value| value[:clause]}.join(' AND '), *conditions)
    end
  end

  def pertence_a_otra_sucursal?(current_user)
    current_user.role.name == 'deposito' && current_user.sucursal != sucursal
  end

  def formato
    if adjunto_content_type == 'application/pdf'
      'pdf'
    elsif adjunto_content_type == 'image/jpg' || adjunto_content_type == 'image/jpeg'
      'jpg'
    else
      nil
    end
  end

  def es_pdf?
    adjunto_content_type == 'application/pdf'
  end

  def es_jpg?
    adjunto_content_type == 'image/jpg' || adjunto_content_type == 'image/jpeg'
  end

  def dir_sucursal
    sucursal.nombre.underscore.gsub(/\s/, '_')
  end

  def adjunto_nombre
    "#{system_id}.#{formato}"
  end

  private

  def fecha_recepcion_is_date?
    if !fecha_recepcion.is_a?(Date) || date_too_old || date_too_new
      errors.add(:fecha_recepcion, 'debe ser una fecha válida')
    end
  end

  def date_too_old
    fecha_recepcion <= '01/01/1970'.to_date
  end

  def date_too_new
    fecha_recepcion >= '31/12/2050'.to_date
  end

end
