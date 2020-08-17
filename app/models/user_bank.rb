class UserBank < ApplicationRecord
  belongs_to :users
  belongs_to :banks
end
