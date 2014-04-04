class AddOwnerIdToBuilding < ActiveRecord::Migration
  def up
    add_column :buildings, :owner_id, :integer
    add_index  :buildings, :owner_id
  end

  def down
    remove_column :buildings, :owner_id
  end
end
