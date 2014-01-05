class AddAttributestoGoalsTable < ActiveRecord::Migration
  def change
  	add_column :goals, :title, :string
  	add_column :goals, :steps_needed, :string
  	add_column :goals, :steps_achieved, :string
  	add_column :goals, :priority, :integer
  	add_column :goals, :target_date, :datetime
  end
end
