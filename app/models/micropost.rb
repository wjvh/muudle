class Micropost < ActiveRecord::Base
  attr_accessible :content, :author, :agree, :disagree, :amused, :mood, :belongs_to_id

  belongs_to :user

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
  validates :author, :presence => true
  validates :agree, :presence => true
  validates :disagree, :presence => true
  validates :amused, :presence => true
  validates :belongs_to_id, :presence => true
  validates :mood, :presence => true

  default_scope :order => 'microposts.created_at DESC'
end
