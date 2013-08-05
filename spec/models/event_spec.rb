require 'spec_helper'

let(:event) { FactoryGirl.create(:event) }

describe Event do
  it { should belong_to(:eventable) }
  it { should have_many(:skills) }

  it { should validate_presence_of(:title) }  
  it { should validate_presence_of(:eventable) }
end
