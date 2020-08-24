class CreateCompanies < ActiveRecord::Migration[6.0]
  def up
    create_table :companies do |t|
      t.string :company_code
      t.string :name
      t.integer :economic_solvency, default: 0
      t.integer :status, default: 0
      t.text :additional_info, default: ''


      t.references :country, index: true, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :companies
  end
end
