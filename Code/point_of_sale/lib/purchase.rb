require 'active_record'

class Purchase < ActiveRecord::Base

  belongs_to :transaction
  belongs_to :cashier

  def self.find_purchases(start_date, end_date)
    purchases = Purchase.all.where(:created_at => (start_date..end_date))
  end

  def self.total_rev(purchase_arr)
    purchase_arr.map{|purchase| purchase.quantity * Product.find(purchase.product_id).cost }.inject(:+)
  end
end
