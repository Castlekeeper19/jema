class CreateMinistries < ActiveRecord::Migration[6.0]
  def change
    create_table :ministries do |t|
      t.string :name
      t.text :description
      t.boolean :jema, default: false
      t.string :website

      t.timestamps
    end
  end
end
