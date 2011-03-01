class CreateMicroposts < ActiveRecord::Migration
  def self.up
    create_table :microposts do |t|
      t.string :content
      t.string :author
      t.integer :user_id
      t.integer :agree
      t.integer :disagree
      t.integer :amused

      t.timestamps
    end
    add_index :microposts, :user_id
  end

  def self.down
    drop_table :microposts
  end
end
