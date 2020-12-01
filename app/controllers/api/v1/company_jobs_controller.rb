class Api::V1::CompanyJobsController < Api::BaseController

  before_action :set_company
  before_action :set_company_job, only: [:show, :update]

  def index
    json_response @company.company_jobs,
                  each_serializer: Api::V1::CompanyJobSerializer
  end

  def create
    json_response @company.company_jobs.create!(company_job_params),
                  status: :created
  rescue Exception => e
    error = {'message': e.message}
    json_response error, status: :unprocessable_entity
  end

  def show
    json_response @company_job
  end

  def update
    if @company_job.update(company_job_params)
      json_response @company_job
    else
      json_response @company_job.errors,
                    status: :unprocessable_entity
    end
  end

  private

    def set_company
      @company = Company.find(params[:company_id])
    rescue
      json_response status: :not_found
    end

    def company_job_params
      params.require(:company_job).permit(
          :job_detail, :monthly_amount, :debt_amount, :contract_date,
          :job_status, :additional_info, :country_id, :company_id,
          :qty_vacancy, :job_title, :company_contact_id
      )
    end

    def set_company_job
      @company_job = @company.company_jobs.find(params[:id])
    rescue
      json_response status: :not_found
    end
end
