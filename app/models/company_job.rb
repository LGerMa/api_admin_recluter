class CompanyJob < ApplicationRecord
  belongs_to :country
  belongs_to :company
  belongs_to :company_contact, optional: true
  has_many :job_vacancies

  enum job_status: {created: 0, published: 1, active: 2, inactive: 3}

  before_create :assign_company_job_code
  after_create :create_jobs_vacancy

  include GeneralConcern

  private
    def assign_company_job_code
      count_code  = 1
      until count_code == 0 do
        job_code = job_start+sample_string(6)
        count_code = job_code_count(job_code)
      end

      self.company_job_code = job_code
    end

    def job_start
      'PLZ-'.freeze
    end

    def job_code_count(code)
      CompanyJob.where(company_job_code: code).count
    end

    def create_jobs_vacancy
      self.qty_vacancy.times do
        self.job_vacancies.create!({status: 0})
      end
    end
end
