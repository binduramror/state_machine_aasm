class AddAasmState < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :aasm_state, :string
  end
end
