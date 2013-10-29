class AttendeeExposition < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :exposition
  
  attr_accessible :attendee_id, :exposition_id
  
  validates :attendee_id, :exposition_id, :presence => true
end
