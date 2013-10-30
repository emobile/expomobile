class Exhibitor < ActiveRecord::Base
  attr_accessible :name, :logo, :social_reason, :job
  has_attached_file :logo,
    :styles => {:medium => "300x300>",
    :thumb => "100x100>",
    :mobile => "32x32>" },
    :default_url => "/assets/missing.jpg"
  has_many :offerts, :dependent => :destroy
  has_one :exposition, :dependent => :destroy
  
  validates :name, :social_reason, :job, :presence => true
  validates :name, :uniqueness => true
end