class Sponsor < ActiveRecord::Base
  attr_accessible :email, :contact, :job, :name, :phone, :twitter, :social_reason, :web_page, :work_street, :work_street_number, :work_colony, :work_zip, :logo
  has_attached_file :logo,
    :styles => {:medium => "x300",
    :thumb => "x100",
    :mobile => "200"},
    :default_url => "/assets/missing.jpg"
  before_save :name_to_upcase
  
  validates :name, :phone, :email, :social_reason, :contact, :job, :presence => true
  validates :name, :uniqueness => true
  
  private
  
  def name_to_upcase
    self.name.upcase! if !name.nil?
    self.social_reason.upcase! if !social_reason.nil?
  end
end