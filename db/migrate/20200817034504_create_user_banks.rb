class CreateUserBanks < ActiveRecord::Migration[6.0]
  def up
    create_table :user_banks do |t|
      t.string :account_number
      t.integer :account_type, default: 0
      t.references :user, index: true, foreign_key: true
      t.references :bank, index: true, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :user_banks
  end
end
