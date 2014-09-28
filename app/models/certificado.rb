class Certificado < ActiveRecord::Base


  belongs_to :proveedor

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

end
