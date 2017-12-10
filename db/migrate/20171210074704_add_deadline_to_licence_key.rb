class AddDeadlineToLicenceKey < ActiveRecord::Migration
  def change
    add_column :licence_keys, :deadline, :date
  end
end
