class RenameTypeInServiceToWorship < ActiveRecord::Migration[6.0]
  def change
    rename_column :services, :type, :worship_type
  end
end
