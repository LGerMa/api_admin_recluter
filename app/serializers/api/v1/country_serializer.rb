class Api::V1::CountrySerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :currency_info
end
