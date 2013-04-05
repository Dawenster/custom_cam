require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  it { should validate_presence_of(:username) }
  it { should respond_to(:username) }

  it { should validate_presence_of(:email) }
  it { should respond_to(:email) }

  it { should validate_presence_of(:password_digest) }
  it { should_not allow_value("blah").for(:email) }
  it { should allow_value("test@test.com").for(:email) }
  it { should ensure_length_of(:password).is_at_least(6) }

  it { should have_many(:contests)}
  it { should have_many(:photos)}
end
