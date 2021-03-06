class Api::V1::CandidateSerializer < ActiveModel::Serializer
  attributes :id, :candidate_code, :name, :email, :lastname, :birthdate,
  :status, :additional_info
  belongs_to :country
  has_many :phones
  has_many :documents
  has_many :work_experiences
end
