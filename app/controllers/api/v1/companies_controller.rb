class Api::V1::CompaniesController < Api::BaseController
  before_action :set_company, only: [:show, :update]

  def index
    json_response Company.all,
                  each_serializer: Api::V1::CompanySerializer
  end

  def create
    json_response Company.create!(company_params), status: :created
  rescue
    error = {'message': e.message}
    json_response error, status: :unprocessable_entity
  end

  def show
    json_response @company
  end

  def update
    if @company.update(company_params)
      json_response @company
    else
      json_response @company.errors,
                    status: :unprocessable_entity
    end
  end

  private

    def company_params
      params.require(:company).permit(
          :name, :additional_info, :country_id
      )
    end

    def set_company
      @company = Company.find(params[:id])
    rescue
      json_response status: :not_found
    end
end
