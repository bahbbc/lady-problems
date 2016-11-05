class RemoveNotNulls < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :full_name, true
    change_column_null :users, :age, true
    change_column_null :users, :facebook_id, true
  end
end
