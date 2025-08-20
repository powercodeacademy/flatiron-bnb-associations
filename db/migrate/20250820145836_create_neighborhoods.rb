class CreateNeighborhoods < ActiveRecord::Migration[7.1]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.integer :city_id

      t.timestamps
    end
  end
end
