class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :dependencies
      t.text :description
      t.references :section, index: true

      t.timestamps
    end
  end
end
