class Group < ActiveRecord::Base
  attr_accessible :name
  has_one :subgroup, :dependent => :destroy
  
  validates :name, :presence => true
end