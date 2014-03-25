require 'spec_helper'

describe 'Product' do
  it 'should add a new product' do
    product = Product.create({ :name => 'Soup', :cost => 4.99 })
    Product.all.first.name.should eq 'Soup'
  end
end
