class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :url
      t.text :dependencies
      t.text :description
      t.references :registration, index: true

      t.timestamps
    end
  end
end
