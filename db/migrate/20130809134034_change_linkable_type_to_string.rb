class ChangeLinkableTypeToString < ActiveRecord::Migration
  def change
  	change_column :links, :linkable_type, :string
  end
end
