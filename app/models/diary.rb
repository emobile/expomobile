class Diary < ActiveRecord::Base
  attr_accessible :event_date, :event_type, :description, :place
  
  validates :event_date, :event_type, :description, :place, :presence => true
  validates_datetime :event_date, :if => :event_date
end
