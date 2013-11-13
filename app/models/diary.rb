class Diary < ActiveRecord::Base
  attr_accessible :event_start_date, :event_end_date, :event_type, :description, :place
  
  validates :event_start_date, :event_end_date, :event_type, :description, :place, :presence => true
  validates_datetime :event_start_date, :event_end_date, :if => :event_start_date? && :event_end_date?
  validate :start_date_less_than_end_date, :if => :event_start_date? && :event_end_date?
  
  private
  
  def start_date_less_than_end_date
    if event_start_date > event_end_date
      errors.add(:event_start_date, :not_less_than_end_date)
    end
  end
end
