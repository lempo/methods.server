class AddTimestampsToLicenceKeys < ActiveRecord::Migration
  def change
    add_timestamps :licence_keys 
  end
end
