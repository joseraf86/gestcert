class Colada < ActiveRecord::Base
  belongs_to :certificado
  #validates :certificado, presence: true

  NUMERIC_REGEX_WITH_HYPHEN = /\A[-0-9]+\z/
  validates :numero,
            format: { with: NUMERIC_REGEX_WITH_HYPHEN },
            uniqueness: { scope: :certificado,
                          message: 'está repetido en el certificado' },
            length: { maximum: 20 }
end
