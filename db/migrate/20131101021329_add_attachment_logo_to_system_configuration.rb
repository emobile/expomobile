class AddAttachmentLogoToSystemConfiguration < ActiveRecord::Migration
  def self.up
    add_column :system_configurations, :logo_file_name, :string
    add_column :system_configurations, :logo_content_type, :string
    add_column :system_configurations, :logo_file_size, :integer
    add_column :system_configurations, :logo_updated_at, :datetime
    add_column :system_configurations, :banner_file_name, :string
    add_column :system_configurations, :banner_content_type, :string
    add_column :system_configurations, :banner_file_size, :integer
    add_column :system_configurations, :banner_updated_at, :datetime
  end

  def self.down
    remove_column :system_configurations, :logo_file_name
    remove_column :system_configurations, :logo_content_type
    remove_column :system_configurations, :logo_file_size
    remove_column :system_configurations, :logo_updated_at
    remove_column :system_configurations, :banner_file_name
    remove_column :system_configurations, :banner_content_type
    remove_column :system_configurations, :banner_file_size
    remove_column :system_configurations, :banner_updated_at
  end
end