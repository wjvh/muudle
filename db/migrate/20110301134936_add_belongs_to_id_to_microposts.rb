class AddBelongsToIdToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :belongs_to_id, :integer
  end

  def self.down
    remove_column :microposts, :belongs_to_id
  end
end
