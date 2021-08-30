class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :gender
      t.string :email_address, null: false
      t.string :contact_number, null: false
      t.string :country

      t.timestamps
    end
  end
end
