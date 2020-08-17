class CreateWorkExperiences < ActiveRecord::Migration[6.0]
  def up
    create_table :work_experiences do |t|
      t.string :position
      t.string :company_name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :current_work_experience, default: false

      t.references :countries, index: true, foreign_key: true
      t.references :workable, polymorphic: true, index: true

      t.timestamps
    end
  end

  def down
    drop_table :work_experiences
  end
end
