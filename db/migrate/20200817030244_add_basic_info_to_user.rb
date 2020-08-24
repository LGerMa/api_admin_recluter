class AddBasicInfoToUser < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :code_user, :string
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :birthdate, :date, default: Date.new(2000, 01, 01)
    add_column :users, :internal_emaiil, :string
    add_column :users, :emergency_info, :jsonb
    add_column :users, :status, :integer, default: 0
    add_column :users, :additional_info, :text, default: ''

    add_reference :users, :country, index:true, foreign_key: true
  end

  def down
    remove_column :users, :code_user
    remove_column :users, :name
    remove_column :users, :lastname
    remove_column :users, :birthdate
    remove_column :users, :internal_emaiil
    remove_column :users, :emergency_info
    remove_column :users, :status
    remove_column :users, :additional_info

    remove_reference :users, :country, index:true, foreign_key: true
  end
end
