class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :owner, foreign_key: { to_table: :users }
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_payer_id, null: false
      t.integer :shipping_from_area_id, null: false
      t.integer :shipping_duration_id, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
