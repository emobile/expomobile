class FaceToFace < ActiveRecord::Base
  attr_accessible :attendee_id, :end_date, :int_name, :int_social_reason, :int_job, :start_date, :subject
  cattr_accessor :action
  belongs_to :attendee
  belongs_to :interviewee 

  validates :attendee_id, :end_date, :int_name, :int_social_reason, :int_job, :start_date, :subject, :presence => true
  validates_datetime :end_date, :if => :end_date
  validates_datetime :start_date, :if => :start_date
  validate :date_not_overlaps, :if => :start_date? && :end_date?
  validate :start_date_less_than_end_date, :if => :start_date? && :end_date?
  
  private
  
  def date_not_overlaps
    overlaps = []
    if action == "update"
      overlaps = FaceToFace.where("? < end_date AND start_date < ? AND int_name = ? AND id != ?", start_date, end_date, int_name, id)
    else
      overlaps = FaceToFace.where("? < end_date AND start_date < ? AND int_name = ?", start_date, end_date, int_name)
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