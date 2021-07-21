class AddCategoryToMinistry < ActiveRecord::Migration[6.0]
  def change
    add_column :ministries, :category, :string
  end
end
