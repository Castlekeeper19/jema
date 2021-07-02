class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
