class Api::V1::WorkExperiencesController < Api::BaseController
  include PolymorphicAssociationConcern
  before_action :find_workable
  before_action :set_work_experience, only: [:show, :update]

  def index
    json_response @workable.work_experiences,
                  each_serializer: Api::V1::WorkExperienceSerializer
  end

  def create
    json_response @workable.work_experiences.create!(work_experience_params),
                 status: :created
  rescue Exception => e
    error = {'message': e.message}
    json_response error, status: :unprocessable_entity
  end

  def show
    json_response @work_experience
  end

  def update
    if @work_experience.update(work_experience_params)
      json_response @work_experience
    else
      json_response @work_experience.errors,
                    status: :unprocessable_entity
    end
  end

  private
    def find_workable
      klass = getKlass
      @klass = klass['klass']
      @workable = @klass.find(klass['value'])
    rescue
      json_response status: :not_found
    end

    def work_experience_params
      params.require(:work_experience).permit(
          :position, :company_name, :description,
          :start_date, :end_date, :current_work_experience,
          :country_id
      )
    end

    def set_work_experience
      @work_experience = @workable.work_experiences.find(params[:id])
    rescue
      json_response status: :not_found
    end
end
