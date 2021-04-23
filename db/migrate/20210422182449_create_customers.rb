class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_
      t.string :name
      t.string :last_name
      t.string :string
      t.string :email
      t.integer :contact_no
      t.text :address
      t.integer :no_of_persons
      t.references :room, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
