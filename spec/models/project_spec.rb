require 'spec_helper'

describe Project do

	describe "Required Attributes Check" do
	  before {@project = Project.new(title: "Test Title", description: "Test Description")} 

	  subject { @project }

	  describe "has required attributes" do
		  it { should respond_to(:title) }
		  it { should respond_to(:description) }
		  it { should be_valid }
	  end

	  describe "does not have required attributes" do
	    before { @project.title = nil }
	    	it { should_not be_valid }

	    before { @project.description = "f" }
	    	it { should_not be_valid }
	  end
	end
end
