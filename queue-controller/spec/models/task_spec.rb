require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Task do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "deveria pertencer a um job" do
    Task.reflect_on_association(:job).macro.should be_eql(:belongs_to)
  end

  it 'deveria ter varias dependencias' do
    Task.reflect_on_association(:dependencies).macro.should be_eql(:has_and_belongs_to_many)
  end
end
