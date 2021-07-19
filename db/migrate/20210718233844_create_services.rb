class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.time :start
      t.time :end
      t.date :day
      t.string :language
      t.references :church, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
