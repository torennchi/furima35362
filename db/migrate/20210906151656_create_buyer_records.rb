class CreateBuyerRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_records do |t|
      t.references :user,           null: false, foreign_key: true
      t.references :item,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
