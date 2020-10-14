class CreateJobVacancies < ActiveRecord::Migration[6.0]
  def up
    create_table :job_vacancies do |t|

      t.date :start_date
      t.date :end_date
      t.integer :status, default: 0

      t.references :company_job, null: false, index: true, foreign_key: true
      t.references :candidate, null: true, index: true, foreign_key: true
      t.references :sale_employee, null: true, index: true, foreign_key: { to_table: :users}
      t.references :interview_employee, null: true, index: true, foreign_key: {to_table: :users}
      t.references :payment_employee, null: true, index:true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end

  def down
    drop_table :job_vacancies
  end
end
