require 'spec_helper'

describe Picture do
  describe "Required Attributes Check" do
	  
	  let(:project) { FactoryGirl.create(:project) }

	  before {@picture = FactoryGirl.create(:picture)} 

	  subject { @picture }

	  describe "has required attributes" do
		  it { should respond_to(:title) }
		  it { should respond_to(:project) }
		  it { should respond_to(:image) }
		  it { should be_valid }
	  end

	  describe "does not have required attributes" do
	    before { @picture.title = nil }
	    	it { should_not be_valid }

	    before { @picture.project = nil }
	    	it { should_not be_valid }

	    before { @picture.image = nil }
	    	it { should_not be_valid }
	  end
	end
end
