class AddAddressToChurch < ActiveRecord::Migration[6.0]
  def change
    add_column :churches, :address1, :string
    add_column :churches, :address2, :string
    add_column :churches, :city, :string
    add_column :churches, :prefecture, :string
    add_column :churches, :post_code, :string
    add_column :churches, :pastor, :string
    add_column :churches, :website, :string
  end
end
