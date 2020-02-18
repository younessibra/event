class AddAdminToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :manager_id, :bigint
  end
end
