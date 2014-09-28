class Certificado < ActiveRecord::Base


  belongs_to :proveedor

  validates :proveedor,
            :numero_certificado,
            :numero_guia_proveedor,
            :numero_codigo_producto,
            :numero_colada,
            :numero_orden_compra,
            presence: true

end
