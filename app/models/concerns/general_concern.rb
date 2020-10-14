module GeneralConcern extend ActiveSupport::Concern

  def sample_string(qty = 2)
    ('A'..'Z').to_a.sample(qty).join
  end
end