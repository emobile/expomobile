class SystemConfiguration < ActiveRecord::Base
  attr_accessible :token, :workshop_tolerance, :exposition_tolerance, :logo, :banner
  has_attached_file :logo,
    :styles => {:medium => "x300",
    :thumb => "x100"},
    :default_url => "/assets/missing.jpg"
  has_attached_file :banner,
    :styles => {:medium => "x300",
    :thumb => "x100"},
    :default_url => "/assets/missing.jpg"
  
  validates_numericality_of :workshop_tolerance, :exposition_tolerance, :numericality => true, :greater_than_or_equal_to => 0
end