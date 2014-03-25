class DropCutomersAddTransactions < ActiveRecord::Migration
  def change
    drop_table :customers
    create_table :transactions do |t|
      t.column :cashier_id, :integer
      t.timestamps
    end
    add_column :purchases, :transaction_id, :integer
  end
end
