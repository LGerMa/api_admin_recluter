class CreateCandidates < ActiveRecord::Migration[6.0]
  def up
    create_table :candidates do |t|
      t.string :candidate_code
      t.string :name, default: ''
      t.string :email, default: ''
      t.string :lastname, default: ''
      t.date :birthdate, default: Date.new(2000, 01, 01)
      t.integer :status, default: 0
      t.text :additional_info, default: ''


      t.references :countries, index: true, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :candidates
  end
end
