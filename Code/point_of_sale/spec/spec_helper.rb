require 'active_record'
require 'shoulda-matchers'

require './lib/product'
require './lib/cashier'
require './lib/purchase'
require './lib/transaction'

database_configurations = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configurations['test']
ActiveRecord::Base.establish_connection(test_configuration)

RSpec.configure do |config|
  config.after(:each) do
    Product.all.each { |product| product.destroy }
    Purchase.all.each { |purchase| purchase.destroy }
    Transaction.all.each { |transaction| transaction.destroy }
    Cashier.all.each { |cashier| cashier.destroy }
  end
end
