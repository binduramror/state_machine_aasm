class UpdateNameColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :first_name, :string
    remove_column :customers, :first_, :string
    remove_column :customers, :name, :string
  end
end
