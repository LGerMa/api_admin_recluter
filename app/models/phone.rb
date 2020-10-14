class Phone < ApplicationRecord
  belongs_to :phoneable, polymorphic: true

  enum phone_type: { cellphone: 0, house: 1 }
end
