class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.integer :customer_id, null: false
      t.integer :reply_id
      t.string :subject, null: false
      t.text :content, null: false
      t.text :reply_content
      t.timestamps
    end
  end
end
