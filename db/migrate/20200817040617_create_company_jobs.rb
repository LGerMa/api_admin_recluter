class CreateCompanyJobs < ActiveRecord::Migration[6.0]
  def up
    create_table :company_jobs do |t|
      t.string :company_job_code

      t.text :job_detail, default: ''
      t.integer :monthly_amount, precision: 5, scale: 2
      t.integer :debt_amount, precision: 5, scale: 2
      t.date :contract_date
      t.integer :job_status, default: 0
      t.text :additional_info, default: ''



      t.references :country, index: true, foreign_key: true
      t.references :company, index: true,  foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :company_jobs
  end
end
