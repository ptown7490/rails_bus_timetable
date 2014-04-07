require 'spec_helper'

describe Station do
  it { should validate_uniqueness_of :number }
  it { should validate_presence_of :number }
end
