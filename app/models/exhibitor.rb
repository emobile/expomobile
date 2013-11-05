class Exhibitor < ActiveRecord::Base
  attr_accessible :name, :contact, :exposition_key, :logo, :social_reason, :job
  has_attached_file :logo,
    :styles => {:medium => "x300",
    :thumb => "x100",
    :mobile => "x64" },
    :default_url => "/assets/missing.jpg"
  has_many :offerts, :dependent => :destroy
  has_one :exposition, :dependent => :destroy
  
  validates :name, :social_reason, :job, :presence => true
  validates :name, :uniqueness => true
  validates :social_reason, :uniqueness => true   
end