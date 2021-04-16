class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :person_name
      t.text :person_address
      t.integer :person_id
      t.integer :no_of_romms
      t.numeric :amount_per_room

      t.timestamps
    end
  end
end
