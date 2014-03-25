require 'spec_helper'
describe Purchase do
  it{should belong_to(:transaction)}
  it{should belong_to(:cashier)}

  describe 'Purchase.find_purchases' do
    it 'should return all the purchases within a given range' do
      p = Product.create({:name => 'tea', :cost => 1.0})
      c = Cashier.create({:name => "Eli"})
      purchase = Purchase.create({:cashier_id => Cashier.login("Eli"), :product_id =>p.id, :quantity => 1})
      Purchase.find_purchases('01-01-1900', '01-01-2051').should eq [purchase]
    end
  end
  describe 'Purchase.total_rev' do
    it 'should return the revenue from a collection of purchases' do
      p = Product.create({:name => 'tea', :cost => 1.0})
      p1 = Product.create({:name => 'coffee', :cost => 2.5})
      c = Cashier.create({:name => "Eli"})
      purchase = Purchase.create({:cashier_id => Cashier.login("Eli"), :product_id =>p.id, :quantity => 1})
      purchase = Purchase.create({:cashier_id => Cashier.login("Eli"), :product_id =>p1.id, :quantity => 2})
      Purchase.total_rev(Purchase.find_purchases('01-01-1900', '01-01-2051')).should eq 6
    end
  end
end
