class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :subject, null: false
      t.text :content, null: false
      t.text :reply_content
      t.timestamps
    end
  end
end
