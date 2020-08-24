class Bank < ApplicationRecord
  belongs_to :country
  has_many :user_banks
end
