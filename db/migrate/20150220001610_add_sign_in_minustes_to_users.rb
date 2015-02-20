class AddSignInMinustesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sign_in_minutes, :integer, default: 0
  end
end
