class Hour < ActiveRecord::Base
  attr_accessible :end_date, :start_date
  cattr_accessor :action
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
  validate :date_not_overlaps, :if => :start_date? && :end_date?
  validate :start_date_less_than_end_date, :if => :start_date? && :end_date?
  
  private
  
  def date_not_overlaps
    overlaps = []
    if action == "update"
      overlaps = Hour.where("? < end_date AND start_date < ? AND id != ?", start_date, end_date, id)
    else
      overlaps = Hour.where("? < end_date AND start_date < ?", start_date, end_date)
    end
    if overlaps.any?
      errors.add(:base, :overlaps)
    end
  end
  
  def start_date_less_than_end_date
    if start_date > end_date
      errors.add(:start_date, :not_less_than_end_date)
    end
  end
end