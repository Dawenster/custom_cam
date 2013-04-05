require 'spec_helper'

describe Contest do
  let(:contest) { FactoryGirl.create(:contest) }

  it { should validate_presence_of :title }
  it { should respond_to :title }

  it { should validate_presence_of :description }
  it { should respond_to :description }

  it { should validate_presence_of :category }
  it { should respond_to :category }

  it { should validate_presence_of :price }
  it { should validate_numericality_of :price }
  it { should respond_to :price }

  it { should validate_presence_of :creator_id }
  it { should respond_to :creator_id }

  
  
end
