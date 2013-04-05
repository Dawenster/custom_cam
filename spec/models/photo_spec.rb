require 'spec_helper'

describe Photo do
  let(:photo) { FactoryGirl.create(:photo) }

  it { should validate_presence_of :url }
  it { should respond_to :url }

  it { should respond_to :user_id }
  it { should validate_presence_of :user_id }

  it { should respond_to :description }
  it { should respond_to :contest }

end

