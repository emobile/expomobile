class Conference < ActiveRecord::Base
  attr_accessible :conferencist, :end_date, :name, :observations, :place, :start_date
  
  validates :name, :conferencist, :end_date, :start_date, :place, :presence => true
  validates_datetime :end_date, :if => :end_date?
  validates_datetime :start_date, :if => :start_date?
  validate :start_date_less_than_end_date, :if => :start_date? && :end_date?
  
  private
  
  def start_date_less_than_end_date
    if start_date > end_date
      errors.add(:start_date, :not_less_than_end_date)
    end
  end
end
