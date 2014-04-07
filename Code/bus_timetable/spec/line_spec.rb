require 'spec_helper'

describe Line do
  it { should have_and_belong_to_many :stations }
  # it { should belong_to_many :stations }
end
