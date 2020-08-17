class CreateBanks < ActiveRecord::Migration[6.0]
  def up
    create_table :banks do |t|
      t.string :name, default: ''
      t.integer :status, default: 0

      t.references :countries, index:true, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :banks
  end
end
