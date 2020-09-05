class Company < ApplicationRecord
  belongs_to :country
  has_many :company_jobs
  has_many :company_contacts, :as => :contactable
  has_many :documents, :as => :documentable

  enum status: { active: 0, inactive: 1 }

  before_create :assign_company_code

  include GeneralConcern

  private
    def assign_company_code
      count_code = 1
      until count_code == 0 do
        company_code = company_start+sample_string(6)
        count_code = company_code_count(company_code)
      end

      self.company_code = company_code

    end

    def company_start
      'CMP-'.freeze
    end

    def company_code_count(code)
      Company.where(company_code: code).count
    end
end
