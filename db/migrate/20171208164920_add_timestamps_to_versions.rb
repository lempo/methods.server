class AddTimestampsToVersions < ActiveRecord::Migration
  def change
    add_timestamps :versions
  end
end
