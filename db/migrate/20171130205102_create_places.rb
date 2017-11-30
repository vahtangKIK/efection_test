class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.belongs_to :restraunt, null: false, index: true
      t.timestamps
    end
    add_foreign_key(:places, :restraunts)
  end
end
