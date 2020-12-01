class AddRefCompanyContactToCompanyJob < ActiveRecord::Migration[6.0]
  def up
    add_reference :company_jobs, :company_contact, null: true, foreign_key: true
  end

  def down
    remove_column :company_jobs, :company_contact_id
  end
end
