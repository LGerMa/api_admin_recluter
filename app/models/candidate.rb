class Candidate < ApplicationRecord
  belongs_to :country
  has_many :phones, :as => :phoneable
  before_create :assign_candidate_code, :config_date

  enum status: { active: 0, inactive: 1 }

  private
  def assign_candidate_code
    year = '%02d' % (self.birthdate.to_date.year % 100)
    month = '%02d' % (self.birthdate.to_date.month)
    lastname = self.lastname === "" ? sample_string : self.lastname[0..1].upcase
    candidate_code = candidate_start+lastname+month.to_s+year.to_s
    count = Candidate.where('candidate_code ILIKE ? ', "%"+candidate_code+"%").count
    self.candidate_code = candidate_code+count.to_s
  rescue
    now = Time.now.to_date
    year = '%02d' % (now.year % 100)
    month = '%02d' % (now.month)
    lastname = sample_string
    candidate_code = candidate_start+lastname+month+year
    count = Candidate.where('candidate_code ILIKE ? ', "%"+candidate_code+"%").count
    self.candidate_code = candidate_code+count.to_s
  end

  def sample_string
    ('A'..'Z').to_a.sample(2).join
  end

  def config_date
    self.birthdate.to_date
  end

  def candidate_start
    'CND-'.freeze
  end
end
