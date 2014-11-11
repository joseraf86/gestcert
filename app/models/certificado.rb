class Certificado < ActiveRecord::Base
  self.per_page = 5

  belongs_to :proveedor
  belongs_to :sucursal
  has_many   :coladas, dependent: :destroy
  accepts_nested_attributes_for :coladas, :reject_if => lambda { |a| a[:numero].blank? }, :allow_destroy => true

  has_attached_file :adjunto, { path: ':rails_root/public/certificados/:filename',
                                url: ':filename',
                                use_timestamp: false }

  validates_attachment_content_type :adjunto, :content_type => /(\Aapplication\/pdf\Z)|\Aimage\/jpeg\Z/

  validate :fecha_recepcion_is_date?

  validates :proveedor,
            :sucursal,
            :numero_certificado,
            :numero_guia_proveedor,
            :numero_codigo_producto,
            :numero_orden_compra,
            :adjunto,
            presence: true

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
      query[:n_colada] = {clause: 'numero_colada LIKE ?', parameter: search[:n_colada]}
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
    conditions = query.collect {|key, value| value[:parameter]}
    if query.empty?
      all
    else
      where(query.collect {|key, value| value[:clause]}.join(' AND '), *conditions)
    end
  end

  def pertence_a_otra_sucursal?(current_user)
    current_user.role.name == 'deposito' && current_user.sucursal != sucursal
  end

  def formato
    if adjunto_content_type == 'application/pdf'
      'pdf'
    elsif adjunto_content_type == 'image/jpg'
      'jpg'
    end
  end

  def es_pdf?
    adjunto_content_type == 'application/pdf'
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
