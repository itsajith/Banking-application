class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :transaction_type
      t.string :transaction_number
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
