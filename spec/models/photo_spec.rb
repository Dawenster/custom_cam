require 'spec_helper'

describe Photo do
  let(:photo) { FactoryGirl.create(:photo) }

  subject { photo }

  it { should be_valid }
  it { should respond_to :url }
  it { should respond_to :description }
  it { should respond_to :contest }
  it { should respond_to :user } # user_id?
  it { should validate_presence_of :user } # user_id?
  it { should validate_presence_of :url }
end
