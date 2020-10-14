class Api::V1::WorkExperienceSerializer < ActiveModel::Serializer
  attributes :id, :position, :company_name, :description,
              :start_date, :end_date, :current_work_experience
  belongs_to :workable
end
