class LicenceKey < ActiveRecord::Migration
  def change
	add_column :licence_keys, :key, :string
  end
end
