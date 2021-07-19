class AddUserToChurch < ActiveRecord::Migration[6.0]
  def change
    add_reference :churches, :user, null: false, foreign_key: true
  end
end
