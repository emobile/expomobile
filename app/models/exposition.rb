class Exposition < ActiveRecord::Base
  belongs_to :stand
  belongs_to :exhibitor
  attr_accessible :name, :end_date, :start_date, :stand_id, :exhibitor_id
  
  validates :name, :end_date, :exhibitor_id, :stand_id, :start_date, :presence => true
  validates_datetime :end_date, :if => :end_date
  validates_datetime :start_date, :if => :start_date
  validate :start_date_less_than_end_date, :if => :start_date? && :end_date?
  
  private
  
  def start_date_less_than_end_date
    if start_date > end_date
      errors.add(:start_date, :not_less_than_end_date)
    end
  end
end