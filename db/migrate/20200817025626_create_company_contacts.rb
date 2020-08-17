class CreateCompanyContacts < ActiveRecord::Migration[6.0]
  def up
    create_table :company_contacts do |t|
      t.string :contact_name, default: ''
      t.string :contact_position, default: ''
      t.string :contact_phone, default: ''
      t.string :contact_email, default: ''

      t.references :contactable, polymorphic: true, index: true
      t.timestamps
    end
  end

  def down
    drop_table :company_contacts
  end
end
