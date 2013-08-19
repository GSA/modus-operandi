class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.string :url
      t.integer :linkable_id
      t.integer :linkable_type

      t.timestamps
    end
  end
end
