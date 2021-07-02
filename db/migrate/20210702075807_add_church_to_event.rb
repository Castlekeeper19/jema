class AddChurchToEvent < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :church, null: true, foreign_key: true
  end
end
