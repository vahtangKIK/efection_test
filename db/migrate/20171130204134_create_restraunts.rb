class CreateRestraunts < ActiveRecord::Migration[5.1]
  def change
    create_table :restraunts do |t|
      t.string :name, index: false, null: false
      t.integer :schedule_begin, index: true, null: false
      t.integer :schedule_end, index: true, null: false
      t.timestamps
    end
  end
end
