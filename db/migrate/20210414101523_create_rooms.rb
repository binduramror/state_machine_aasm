class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :room_no
      t.string :name
      t.string :room_type
      t.text :facilities
      t.string :status
      t.integer :price

      t.timestamps
    end
  end
end
