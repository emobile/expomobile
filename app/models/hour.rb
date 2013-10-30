class Hour < ActiveRecord::Base
  attr_accessible :end_date, :start_date
  has_many :schedules, :dependent => :destroy
  has_many :subgroups, :through => :schedules
  has_many :workshops, :through => :schedules
 
  def start_hour
    start_date.strftime("%I:%M%p")
  end
  
  def end_hour
    end_date.strftime("%I:%M%p")
  end
  
  validates :start_date, :end_date, :presence => true
  validates_datetime :start_date, :if => :start_date
  validates_datetime :end_date, :if => :end_date
  validate :start_date_less_than_end_date, :if => :start_date? && :end_date?
  
  private
  
  def start_date_less_than_end_date
    if start_date > end_date
      errors.add(:start_date, :not_less_than_end_date)
    end
  end
end