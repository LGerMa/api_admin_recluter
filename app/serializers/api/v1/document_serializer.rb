class Api::V1::DocumentSerializer < ActiveModel::Serializer
  attributes :id, :document_value
  belongs_to :document_type
  belongs_to :documentable
end
