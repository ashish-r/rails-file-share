class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.boolean :shared, default: false, null: false
      t.string :key, index: {unique: true}, null: false
      t.references :user
      t.timestamps
    end
  end
end
