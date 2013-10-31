class Stand < ActiveRecord::Base
  belongs_to :exhibitor
  has_one :exposition, :dependent => :destroy
  attr_accessible :name, :exhibitor_id
  
  validates :name, :presence => true
  validates_uniqueness_of :exhibitor_id
  before_destroy :stand_with_exposition?

  private

  def stand_with_exposition?
    return exposition.nil?
  end
end