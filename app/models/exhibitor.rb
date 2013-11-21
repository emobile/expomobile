class Exhibitor < ActiveRecord::Base
  attr_accessible :name, :contact, :exposition_key, :logo, :social_reason, :job, :stand_location, :stand_size
  has_attached_file :logo,
    :styles => {:medium => "x300",
    :thumb => "x100",
    :mobile => "200" },
    :default_url => "/assets/missing.jpg"
  has_many :offerts, :dependent => :destroy
  before_save :name_to_upcase
  
  validates :name, :social_reason, :job, :presence => true
  validates :name, :uniqueness => true
  validates :social_reason, :uniqueness => true
  
  private
  
  def name_to_upcase
    self.name.upcase! if !name.nil?
    self.social_reason.upcase! if !social_reason.nil?
  end
end