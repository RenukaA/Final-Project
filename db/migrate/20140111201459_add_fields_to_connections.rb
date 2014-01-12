class AddFieldsToConnections < ActiveRecord::Migration
  def change
    add_column :connections, :user_id, :integer
    add_column :connections, :linkedin_id, :string
    add_column :connections, :note, :text
  end
end
