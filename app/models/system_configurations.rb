class SystemConfigurations < ActiveRecord::Base
  attr_accessible :token, :workshop_tolerance, :exposition_tolerance
  
  validates_numericality_of :workshop_tolerance, :exposition_tolerance, :numericality => true, :greater_than_or_equal_to => 0
end
