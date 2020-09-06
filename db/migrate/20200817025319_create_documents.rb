class CreateDocuments < ActiveRecord::Migration[6.0]
  def up
    create_table :documents do |t|

      t.string :document_value, default: ''

      t.references :document_type, index: true, foreign_key: true
      t.references :documentable, polymorphic: true, index: true
      t.timestamps
    end
  end

  def down
    drop_table :documents
  end
end
