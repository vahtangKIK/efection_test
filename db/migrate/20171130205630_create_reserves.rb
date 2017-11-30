class CreateReserves < ActiveRecord::Migration[5.1]
  def change
    create_table :reserves do |t|
      t.belongs_to :place, null: false, index: true
      t.timestamp :reserve_time_begin
      t.timestamp :reserve_time_end
      t.text :people
      t.text :comment
      t.timestamps
    end
    add_foreign_key(:reserves, :places)
  end
end
