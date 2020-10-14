class AddExtraInfoToCompanyJobs < ActiveRecord::Migration[6.0]
  def up
    add_column :company_jobs, :qty_vacancy, :integer, default: 0
    add_column :company_jobs, :job_title, :string
  end

  def down
    remove_column :company_jobs, :qty_vacancy, :integer
    remove_column :company_jobs, :job_title, :string
  end
end
