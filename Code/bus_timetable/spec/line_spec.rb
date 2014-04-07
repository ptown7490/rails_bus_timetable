require 'spec_helper'

describe Line do
  it { should validate_uniqueness_of :number }
  it { should validate_presence_of :number }
  it { should have_many :stations }
end
