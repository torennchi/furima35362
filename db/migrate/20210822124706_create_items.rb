class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name
      t.string :text
      t.integer :category_id, null: false
      t.integer :price,           null: false
      t.references :user,           foreign_key: true
      t.integer :status_id,               null: false
      t.integer :cost_id,       null: false
      t.integer :area_id,          null: false
      t.integer :shipping_day_id,          null: false
      t.timestamps
    end
  end
end
