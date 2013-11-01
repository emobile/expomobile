class Workshop < ActiveRecord::Base
  attr_accessible :name, :workshop_key, :room_id, :teacher_name
  belongs_to :room
  has_many :schedules
  has_many :subgroups, :through => :schedules
  has_many :hours, :through => :schedules
  
  validates :name, :workshop_key, :room_id, :teacher_name, :presence => true
  validates :room_id, :uniqueness => true
  before_destroy :workshop_with_subgroups?
  
  private
  
  def workshop_with_subgroups?
    return subgroups.blank?
  end
end