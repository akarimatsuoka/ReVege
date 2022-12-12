class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name, null: false, default: ""
      t.text :introduction, null: false, default: ""
      t.integer :postal_code, null: false, default: ""
      t.string :prefecture, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :phone_number, null: false, default: ""
      t.timestamps
    end
  end
end
