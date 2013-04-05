require 'spec_helper'

describe Category do
  let(:category) { FactoryGirl.create(:category) }

  it { should validate_presence_of :title }
  it { should respond_to :title }
end
