class Cashier < ActiveRecord::Base

    has_many :transactions
    has_many :purchases

  def self.login(name)
    Cashier.find_by({:name => name}).id
  end

end
