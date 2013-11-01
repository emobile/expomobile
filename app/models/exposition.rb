class Exposition < ActiveRecord::Base
  belongs_to :stand
  belongs_to :exhibitor
  attr_accessible :name, :end_date, :start_date, :stand_id, :exhibitor_id, :exposition_key
  cattr_accessor :action
  
  validates :name, :end_date, :exhibitor_id, :stand_id, :start_date, :exposition_key, :presence => true
  validates_datetime :end_date, :if => :end_date
  validates_datetime :start_date, :if => :start_date
  validate :start_date_less_than_end_date, :if => :start_date? && :end_date?
  validate :date_not_overlaps_in_stand, :if => :start_date? && :end_date?
  
  private
  
  def date_not_overlaps_in_stand
    overlaps = []
    if action == "update"
      overlaps = Exposition.where("start_date < ? AND end_date > ? AND stand_id = ? AND id != ?", end_date, start_date, stand_id, id)
    else
      overlaps = Exposition.where("start_date < ? AND end_date > ? AND stand_id = ?", end_date, start_date, stand_id)
    end
    if overlaps.any?
      errors.add(:base, :overlaps_in_stand)
    end
  end
  
  def start_date_less_than_end_date
    if start_date > end_date
      errors.add(:start_date, :not_less_than_end_date)
    end
  end
end