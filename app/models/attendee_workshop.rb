class AttendeeWorkshop < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :workshop
  
  attr_accessible :attendee_id, :workshop_id
  
  validates :attendee_id, :workshop_id, :presence => true
end