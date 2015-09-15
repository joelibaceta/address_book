class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :email
      t.string :phone
      t.attachment :avatar

      t.timestamps null: false
    end
  end
end
