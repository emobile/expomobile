class Exposition < ActiveRecord::Base
  belongs_to :stand
  attr_accessible :name, :end_date, :start_date, :location, :exhibitor_name, :exposition_key
  cattr_accessor :action
  
  validates :name, :end_date, :exhibitor_name, :location, :start_date, :presence => true
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