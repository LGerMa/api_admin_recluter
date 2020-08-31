class Bank < ApplicationRecord
  belongs_to :country
  has_many :user_banks

  enum status: { active: 0, inactive: 1 }
end
