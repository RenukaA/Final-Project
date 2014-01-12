class AddMoreFieldsToConnections < ActiveRecord::Migration
  def change
    add_column :connections, :title, :string
    add_column :connections, :context_of_introduction, :text
    add_column :connections, :role_or_purpose, :text
    add_column :connections, :last_communication_date, :datetime
    add_column :connections, :next_communication_date, :datetime
  end
end
