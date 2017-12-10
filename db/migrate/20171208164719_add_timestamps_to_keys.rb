class AddTimestampsToKeys < ActiveRecord::Migration
  def change
    add_timestamps :keys
  end
end
