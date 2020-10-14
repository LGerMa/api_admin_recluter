class Api::V1::DocumentTypeSerializer < ActiveModel::Serializer
  attributes :id, :doc_type, :status, :description
end
