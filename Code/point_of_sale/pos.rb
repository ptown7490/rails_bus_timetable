require 'active_record'
require './lib/product'
require './lib/purchase'
require './lib/cashier'
require './lib/transaction'


database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)



def welcome
  puts "WELCOME to the ruby store"
  menu
end

def menu
  puts "Type 'a' to add a product to the ruby store!"
  puts "Type ls to list the products in the ruby store!"
  puts "Type 'buy' to make us rich beyond all imagination"
  puts "Type 'login' to login in as a cashier"
  puts "***************************************************************"
  input = gets.chomp
  case input
  when 'a'
    add_product
  when 'ls'
    list_products
  when 'buy'
    buy
  when 'ST'
    puts 'enter a start date'
    start = gets.chomp
    puts 'enter an end date'
    end_date = gets.chomp
    puts "Total revenue for that date range"
    puts "$"+Purchase.total_rev(Purchase.find_purchases(start, end_date)).to_s
  when 'MC'
    puts 'Enter start date'
    start_date = gets.chomp
    puts 'Enter end date'
    end_date = gets.chomp
    transactions = Transaction.find_transactions(start_date, end_date)
    puts most_efficient = Transaction.most_efficient_cashier(transactions).name
  else
    "goodbye!"
  end
end

def add_product
  puts "***************************************************************"
  puts 'what is the product name'
  name = gets.chomp
  puts 'what is the product price'
  cost = gets.chomp
  product = Product.create({name: name, cost: cost})
  menu
end

def list_products
  puts "***************************************************************"
  Product.all.each{|product| puts product.name + " cost: " + product.cost.to_s}
  puts "***************************************************************"
  menu
end

def buy
  puts 'What would you like to buy'
  @transaction = []
  t = Transaction.create(:cashier_id => Cashier.login(@loggedin))
  input = gets.chomp
  product = Product.find_by_name(input)
  puts 'Ok, how many'
  qty = gets.chomp
  purchase = Purchase.create(:cashier_id => Cashier.login(@loggedin), :product_id => product.id, :quantity => qty, :transaction_id => t.id )

  puts "Ok your total is #{product.cost * qty.to_i}, press 'p' to print a receipt or 'm' for the main menu"
  @transaction << purchase
  choice = gets.chomp
  case choice
  when 'p'
    @transaction.each do |purchase|
     puts "Product name: " + Product.find(purchase.product_id).name + " Quantity: " + purchase.quantity.to_s + " Cost: $" + Product.find(purchase.product_id).cost.to_s
    end
  when 'm'
    menu
  else
    'choose again dummy!!!!!!!!!!!!'
  end
end



menu
