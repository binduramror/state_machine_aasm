class DeleteStringColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :customers, :string, :string
  end
end
