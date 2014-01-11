class AddColumnsForUpdatingUsers < ActiveRecord::Migration
  def change
  	add_column :users, :li_token, :string
  	add_column :users, :li_secret, :string
  end
end
