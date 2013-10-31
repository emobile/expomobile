class Stand < ActiveRecord::Base
  belongs_to :exhibitor
  has_one :exposition, :dependent => :destroy
  attr_accessible :name, :stand_key, :exhibitor_id
  
  validates :name, :stand_key, :presence => true
  validates_uniqueness_of :exhibitor_id
  before_destroy :stand_with_exposition?

  private

  def stand_with_exposition?
    return exposition.nil?
  end
end