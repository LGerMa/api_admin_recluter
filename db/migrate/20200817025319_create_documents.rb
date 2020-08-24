class CreateDocuments < ActiveRecord::Migration[6.0]
  def up
    create_table :documents do |t|

      t.string :document_value, default: ''
      t.integer :document_type, default: 0

      t.references :documentable, polymorphic: true, index: true
      t.timestamps
    end
  end

  def down
    drop_table :documents
  end
end
