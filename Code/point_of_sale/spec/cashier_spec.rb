require 'spec_helper'
require './lib/cashier'
require './lib/purchase'

describe Cashier do
  it{should have_many(:purchases)}
  it{should have_many(:transactions)}

  describe 'Cashier.login' do
    it 'logs in cashier' do
      cashier1 = Cashier.create({ name: 'Eli' })
      Cashier.login('Eli')
      Cashier.login('Eli').should eq cashier1.id
    end
  end
end
