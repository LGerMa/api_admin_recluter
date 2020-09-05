class Api::V1::DocumentSerializer < ActiveModel::Serializer
  attributes :id, :document_type, :document_value
  belongs_to :documentable
end
