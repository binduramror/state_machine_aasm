class CreateDocumentations < ActiveRecord::Migration[5.0]
  def change
    create_table :documentations do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
