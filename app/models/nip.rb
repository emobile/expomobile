class Nip < ActiveRecord::Base
  attr_accessible :attendee_id, :nip, :sent, :times_sent
  belongs_to :attendee
  
  validates :nip, :attendee_id, :presence => true
  validates_format_of :attendee_id, :with => /\A\d+\z/
  validates_numericality_of :times_sent, :numericality => true, :if => :times_sent?
end