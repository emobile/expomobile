class Sponsor < ActiveRecord::Base
  attr_accessible :email, :job, :name, :phone, :facebook, :twitter, :social_reason, :web_page, :work_address, :logo
  has_attached_file :logo,
    :styles => {:medium => "300x300>",
    :thumb => "100x100>",
    :mobile => "32x32>"},
    :default_url => "/assets/missing.jpg"
  
  validates :name, :phone, :email, :social_reason, :job, :presence => true
  validates :name, :uniqueness => true
end