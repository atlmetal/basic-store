class CreateProduct < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :sku, null: false
      t.string :name, null: false
      t.text :description
      t.integer :available_units, default: 0
      t.float :unit_price, null: false
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
