require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Job do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "deveria ter uma task" do
    Job.reflect_on_association(:tasks).should_not be_nil 
  end
end
