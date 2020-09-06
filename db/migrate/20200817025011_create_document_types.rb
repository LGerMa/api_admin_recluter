class CreateDocumentTypes < ActiveRecord::Migration[6.0]
  def up
    create_table :document_types do |t|
      t.string :doc_type
      t.integer :status, default: 0
      t.text :description

      t.timestamps
    end
  end

  def down
    drop_table :document_types
  end
end
