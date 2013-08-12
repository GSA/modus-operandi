class AddWhatsNextColumnToTasksAndSections < ActiveRecord::Migration
  def change
  	add_column :sections, :whats_next, :text
  	add_column :tasks, :whats_next, :text
  end
end
