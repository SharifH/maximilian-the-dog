class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|

      t.timestamps
    end
  end
end
