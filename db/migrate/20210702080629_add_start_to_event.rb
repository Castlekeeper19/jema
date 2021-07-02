class AddStartToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :start, :datetime
  end
end
