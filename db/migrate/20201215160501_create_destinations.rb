class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.references :order, foreign_key: true
      t.string :zip_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :address1, null: false
      t.string :address2
      t.string :telephone, null: false

      t.timestamps
    end
  end
end
