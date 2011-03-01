class AddMoodToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :mood, :string
  end

  def self.down
    remove_column :microposts, :mood
  end
end
