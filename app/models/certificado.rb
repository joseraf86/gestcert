class Certificado < ActiveRecord::Base
  self.per_page = 5

  belongs_to :proveedor
  belongs_to :sucursal

  has_attached_file :adjunto, 
                    :styles => { :medium => "300x300>",
                                 :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :adjunto, :content_type => /\Aimage\/.*\Z/


  validates :proveedor,
            :numero_certificado,
            :numero_guia_proveedor,
            :numero_codigo_producto,
            :numero_colada,
            :numero_orden_compra,
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
      query[:start_date] = {clause: 'fecha_recepcion >= ?', parameter: search[:start_date].to_date}
    end

    unless search[:end_date].blank?
      query[:end_date] = {clause: 'fecha_recepcion <= ?', parameter: search[:end_date].to_date + 23.hour + 59.second}
    end

    unless search[:sucursal_id].blank?
      query[:sucursal_id] = {clause: 'sucursal_id = ?', parameter: search[:sucursal_id].to_i }
    end

    #puts query.collect {|key, value| value[:parameter]}
    conditions = query.collect {|key, value| value[:parameter]}
    if query.empty?
      all
    else
      where(query.collect {|key, value| value[:clause]}.join(' AND '), *conditions)
    end
  end
end
