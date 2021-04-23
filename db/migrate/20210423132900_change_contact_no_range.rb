class ChangeContactNoRange < ActiveRecord::Migration[5.0]
  def change
    change_column :customers, :contact_no, :string
  end
end
