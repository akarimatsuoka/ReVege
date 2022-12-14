class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.integer :customer_id, null: false
      t.integer :shop_id, null: false

      t.timestamps

    end
    add_index :bookmarks, [:customer_id, :shop_id], unique: :true #customer_idとshop_idは同じ組み合わせは1つだけにしてください
  end
end
