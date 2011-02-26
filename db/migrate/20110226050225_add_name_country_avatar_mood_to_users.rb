class AddNameCountryAvatarMoodToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :country, :string
    add_column :users, :avatar, :string
    add_column :users, :mood, :string
  end

  def self.down
    remove_column :users, :mood
    remove_column :users, :avatar
    remove_column :users, :country
    remove_column :users, :name
  end
end
