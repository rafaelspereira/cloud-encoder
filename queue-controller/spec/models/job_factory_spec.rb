require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe JobFactory do

  before :each do
    Job.stub!(:create!)
  end

  it "deveria obter a duracao de um video" do
    Job.reflect_on_association(:tasks).should_not be_nil
  end

  it "deveria criar um job" do
    Job.should_receive(:create!).with(:input_video => "video.flv", :duration => 1234)
  end
end
