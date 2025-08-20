class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date :checkin
      t.date :checkout
      t.references :listing, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
