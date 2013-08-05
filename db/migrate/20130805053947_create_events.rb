class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :eventable_id
      t.string :eventable_type 
      
      t.timestamps
    end
  end
end