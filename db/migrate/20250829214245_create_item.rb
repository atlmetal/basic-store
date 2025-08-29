class CreateItem < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.integer :quantity, null: false
      t.references :shopping_cart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
