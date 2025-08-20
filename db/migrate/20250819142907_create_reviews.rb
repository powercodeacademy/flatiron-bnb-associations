class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :description
      t.integer :rating
      t.references :guest, foreign_key: { to_table: :users }
      t.references :reservation
      t.timestamps
    end
  end
end
