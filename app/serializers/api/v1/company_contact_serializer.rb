class Api::V1::CompanyContactSerializer < ActiveModel::Serializer
  attributes :id, :contact_name, :contact_phone, :contact_position, :contact_email
  belongs_to :contactable
end
