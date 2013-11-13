class MassiveLoad < ActiveRecord::Base
  attr_accessible :excel_file
  has_attached_file :excel_file
  
  validates_attachment_presence :excel_file
end