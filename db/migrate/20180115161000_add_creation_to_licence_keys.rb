class AddCreationToLicenceKeys < ActiveRecord::Migration
  def change
    add_column :licence_keys, :creation, :date
  end
end
