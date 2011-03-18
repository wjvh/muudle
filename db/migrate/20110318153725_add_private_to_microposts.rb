class AddPrivateToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :private, :boolean
  end

  def self.down
    remove_column :microposts, :private
  end
end
