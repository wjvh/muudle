class Micropost < ActiveRecord::Base
  attr_accessible :content, :author, :agree, :disagree, :amused

  belongs_to :user

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
  validates :author, :presence => true
  validates :agree, :presence => true
  validates :disagree, :presence => true
  validates :amused, :presence => true

  default_scope :order => 'microposts.created_at DESC'
end
