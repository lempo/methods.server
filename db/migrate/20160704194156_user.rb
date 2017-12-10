class User < ActiveRecord::Migration
  def change
   add_column :users, :name, :string
   add_column :users, :pass, :string
  end
end
