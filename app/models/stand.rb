class Stand < ActiveRecord::Base
  belongs_to :exhibitor
  attr_accessible :name, :stand_key, :exhibitor_id
  
  validates :name, :stand_key, :presence => true
end