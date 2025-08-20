class FixHostAndGuestForeignKeys < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :listings, :hosts
    add_foreign_key :listings, :users, column: :host_id

    remove_foreign_key :reservations, :guests
    add_foreign_key :reservations, :users, column: :guest_id

    remove_foreign_key :reviews, :guests
    add_foreign_key :reviews, :users, column: :guest_id
  end
end
