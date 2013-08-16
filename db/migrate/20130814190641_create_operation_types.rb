class CreateOperationTypes < ActiveRecord::Migration
  def change
    create_table :operation_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
