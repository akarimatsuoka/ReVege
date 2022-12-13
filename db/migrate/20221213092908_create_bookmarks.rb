class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true

      t.timestamps

    end
    add_index :bookmarks, [:customer_id, :shop_id], unique: :true
  end
end
