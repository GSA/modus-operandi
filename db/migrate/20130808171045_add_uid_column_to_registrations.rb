class AddUidColumnToRegistrations < ActiveRecord::Migration
  def change
  	add_column :registrations, :uid, :string
  end
end
