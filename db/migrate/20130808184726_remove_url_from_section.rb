class RemoveUrlFromSection < ActiveRecord::Migration
  def change
  	remove_column :sections, :url
  end
end
