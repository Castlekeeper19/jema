class AddLocationToChurch < ActiveRecord::Migration[6.0]
  def change
    add_column :churches, :location, :string
    add_column :churches, :latitude, :float
    add_column :churches, :longitude, :float
  end
end
