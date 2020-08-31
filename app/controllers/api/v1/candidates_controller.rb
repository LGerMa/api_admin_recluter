class Api::V1::CandidatesController < Api::BaseController
  before_action :set_candidate, only: [:show, :update]

  def index
    json_response Candidate.all,
                  each_serializer: Api::V1::CandidateSerializer
  end

  def create
    json_response Candidate.create!(candidate_params), status: :created
  rescue
    error = {'message': e.message}
    json_response error, status: :unprocessable_entity
  end

  def update
    if @candidate.update(candidate_params)
      json_response @candidate
    else
      json_response @candidate.errors,
                    status: :unprocessable_entity
    end
  end

  def show
    json_response @candidate
  end

  private
    def candidate_params
      params.require(:candidate).permit(
          :name, :lastname, :email, :birthdate,
          :status, :aditional_info, :country_id
      )
    end

    def set_candidate
      @candidate = Candidate.find(params[:id])
    rescue
      json_response status: :not_found
    end

end
