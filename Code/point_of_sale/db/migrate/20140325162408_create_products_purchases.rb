class CreateProductsPurchases < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :cost, :float
    end

    create_table :purchases do |t|
      t.column :customer_id, :integer
      t.column :cashier_id, :integer
      t.column :product_id, :integer
      t.column :quantity, :integer

      t.timestamps
    end

    create_table :customers do |t|
      t.column :name, :string
    end

    create_table :cashiers do |t|
      t.column :name, :string
    end
  end
end
