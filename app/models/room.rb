class Room < ActiveRecord::Base
  attr_accessible :name, :room_key
  has_one :workshop
  
  validates :name, :room_key, :presence => true
  before_destroy :room_with_workshop?

  private

  def room_with_workshop?
    return workshop.nil?
  end
end