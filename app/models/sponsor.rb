class Sponsor < ActiveRecord::Base
  attr_accessible :email, :contact, :job, :name, :phone, :twitter, :social_reason, :web_page, :work_street, :work_street_number, :work_colony, :work_zip, :logo
  has_attached_file :logo,
    :styles => {:medium => "x300",
    :thumb => "x100",
    :mobile => "x64"},
    :default_url => "/assets/missing.jpg"
  
  validates :name, :phone, :email, :social_reason, :contact, :job, :presence => true
  validates :name, :uniqueness => true
end