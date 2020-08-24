class CreatePhones < ActiveRecord::Migration[6.0]
  def up
    create_table :phones do |t|
      t.string :phone_number
      t.integer :phone_type, default: 0
      t.references :phoneable, polymorphic: true, index: true

      t.timestamps
    end
  end

  def down
    drop_table :phones
  end
end
