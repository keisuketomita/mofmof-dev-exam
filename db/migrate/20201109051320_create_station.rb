class CreateStation < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :route
      t.string :name
      t.integer :minute 
    end
  end
end
