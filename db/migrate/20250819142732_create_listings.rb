class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :address
      t.string :listing_type
      t.string :title
      t.text :description
      t.decimal :price
      t.references :neighborhood, foreign_key: true
      t.references :host, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
