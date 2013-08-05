require 'spec_helper'

let(:skill) { FactoryGirl.create(:skill) }

describe Skill do
  it { should belong_to(:skillable) }
  it { should have_many(:events) }

  it { should validate_presence_of(:tag) }  
  it { should validate_presence_of(:skillable) }
end