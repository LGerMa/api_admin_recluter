class Api::V1::PhoneSerializer < ActiveModel::Serializer
  attributes :id, :phone_number, :phone_type
  belongs_to :phoneable
end
