class Stand < ActiveRecord::Base
  belongs_to :exhibitor
  has_one :exposition
  attr_accessible :name
  
  validates :name, :presence => true
  before_destroy :stand_with_exposition?

  private

  def stand_with_exposition?
    return exposition.nil?
  end
end