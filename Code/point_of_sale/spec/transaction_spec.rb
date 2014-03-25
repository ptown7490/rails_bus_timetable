require 'spec_helper'
require './lib/transaction'
require './lib/purchase'

describe Transaction do
 it {should have_many(:purchases)}

 describe 'Transaction.date_range' do
   it 'should return transaction objects with created date in the specified range' do
      p = Product.create({:name => 'tea', :cost => 1.0})
      p1 = Product.create({:name => 'coffee', :cost => 2.5})
      c = Cashier.create({:name => "Eli"})
      t = Transaction.create({:cashier_id => c.id })
      purchase1 = Purchase.create({:cashier_id => Cashier.login("Eli"), :product_id =>p.id, :quantity => 1, :transaction_id => t.id})
      purchase2 = Purchase.create({:cashier_id => Cashier.login("Eli"), :product_id =>p1.id, :quantity => 2, :transaction_id => t.id})
      t1 = Transaction.create({:cashier_id => c.id })
      purchase3 = Purchase.create({:cashier_id => Cashier.login("Eli"), :product_id =>p.id, :quantity => 3, :transaction_id => t.id})
      purchase4 = Purchase.create({:cashier_id => Cashier.login("Eli"), :product_id =>p1.id, :quantity => 4, :transaction_id => t.id})
      c2 = Cashier.create({:name => "Dan"})
      t2 = Transaction.create({:cashier_id => c2.id })
      purchase5 = Purchase.create({:cashier_id => Cashier.login("Dan"), :product_id =>p.id, :quantity => 10, :transaction_id => t.id})
      purchase6 = Purchase.create({:cashier_id => Cashier.login("Dan"), :product_id =>p1.id, :quantity => 9, :transaction_id => t.id})
      Transaction.find_transactions('01-01-1900', '01-01-2051').should eq [t, t1, t2]
   end
  end

  describe 'Transaction.most_efficient_cashier' do
    it 'takes an array of purchases and return the cashier with the most transactions' do
      p = Product.create({:name => 'tea', :cost => 1.0})
      p1 = Product.create({:name => 'coffee', :cost => 2.5})
      c = Cashier.create({:name => "Eli"})
      t = Transaction.create({:cashier_id => c.id })
      purchase1 = Purchase.create({:cashier_id => Cashier.login("Eli"), :product_id =>p.id, :quantity => 1, :transaction_id => t.id})
      purchase2 = Purchase.create({:cashier_id => Cashier.login("Eli"), :product_id =>p1.id, :quantity => 2, :transaction_id => t.id})
      t1 = Transaction.create({:cashier_id => c.id })
      purchase3 = Purchase.create({:cashier_id => Cashier.login("Eli"), :product_id =>p.id, :quantity => 3, :transaction_id => t.id})
      purchase4 = Purchase.create({:cashier_id => Cashier.login("Eli"), :product_id =>p1.id, :quantity => 4, :transaction_id => t.id})
      c2 = Cashier.create({:name => "Dan"})
      t2 = Transaction.create({:cashier_id => c2.id })
      purchase5 = Purchase.create({:cashier_id => Cashier.login("Dan"), :product_id =>p.id, :quantity => 10, :transaction_id => t.id})
      purchase6 = Purchase.create({:cashier_id => Cashier.login("Dan"), :product_id =>p1.id, :quantity => 9, :transaction_id => t.id})
      Transaction.most_efficient_cashier(Transaction.find_transactions('01-01-1900', '01-01-2051')).should eq c
    end
  end
end
