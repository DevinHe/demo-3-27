class RemoveEmailIndexFromUsers < ActiveRecord::Migration
  def change
    remove_index :users,    :email
    add_index    :users,    :name,   unique: true
  end
end
