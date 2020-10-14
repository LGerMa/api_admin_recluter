class Api::V1::JobVacanciesController < Api::BaseController

  before_action :set_company_job
  before_action :set_job_vacancy, only: [:show, :update]


  def index
    json_response @company_job.job_vacancies,
                  each_serializer: Api::V1::JobVacancySerializer
  end

  def create
    json_response @company_job.job_vacancies.create!(job_vacancy_params),
                  status: :created
  rescue Exception => e
    error = {'message': e.message}
    json_response error, status: :unprocessable_entity
  end

  def show
    json_response @job_vacancy
  end

  def update
    if @job_vacancy.update(job_vacancy_params)
      json_response @job_vacancy
    else
      json_response @job_vacancy.errors,
                    status: :unprocessable_entity
    end
  end

  private

    def set_company_job
      @company_job = CompanyJob.find(params[:company_job_id])
    rescue
      json_response status: :not_found
    end

    def job_vacancy_params
      params.require(:job_vacancy).permit(
          :start_date, :end_date, :status, :sale_employee_id,
          :interview_employee_id, :payment_employee_id, :candidate_id
      )
    end

    def set_job_vacancy
      @job_vacancy = @company_job.job_vacancies.find(params[:id])
    rescue
      json_response status: :not_found
    end

    def set_company
      @company = Company.find(parmas[:company_id])
    rescue
      json_response status: :not_found
    end
end
