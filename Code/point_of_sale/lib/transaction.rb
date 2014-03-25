
class Transaction < ActiveRecord::Base
  has_many :purchases

  def self.find_transactions(start_date, end_date)
    transactions = Transaction.all.where(:created_at => (start_date..end_date))
  end

  def self.most_efficient_cashier(transactions_array)
    freq = transactions_array.map{|transaction| transaction.cashier_id}.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    Cashier.find(freq.max_by { |v| freq[v] }[0])
  end
end


