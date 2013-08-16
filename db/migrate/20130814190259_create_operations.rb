class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :name
      t.text :description
      t.text :dependencies
      t.text :whats_next
      t.string :url
      t.integer :operation_type_id
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.text :help

      t.timestamps
    end
  end
end
