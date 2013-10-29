class Room < ActiveRecord::Base
  attr_accessible :name, :room_key
  has_one :workshop, :dependent => :destroy
  
  validates :name, :room_key, :presence => true
end