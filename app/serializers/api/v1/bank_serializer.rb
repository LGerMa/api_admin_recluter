class Api::V1::BankSerializer < ActiveModel::Serializer
  attributes :id, :name, :status
  belongs_to  :country, serializer: Api::V1::CountrySerializer
end
