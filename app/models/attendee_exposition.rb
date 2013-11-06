class AttendeeExposition < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :expositor
  
  attr_accessible :attendee_id, :exhibitor_id
  
  validates :attendee_id, :exhibitor_id, :presence => true
end
