require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Task do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "deveria pertencer a um job" do
    Task.reflect_on_association(:job).macro.should be_eql(:belongs_to)
  end
end
