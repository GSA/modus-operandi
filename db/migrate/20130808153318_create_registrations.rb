class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|

      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
