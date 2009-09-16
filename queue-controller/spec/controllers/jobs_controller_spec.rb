require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe JobsController do

  describe "Routing" do
    it "deveria rotear {:controller => 'jobs', :action => 'create'}" do
      route_for(:controller => 'jobs', :action => 'create').should == {:path => '/jobs', :method => :post}
    end
  end

  describe "Recebendo um POST em /jobs" do
    it "deveria criar um job ao receber um POST" do
      @params_video = {"action"=>"create", "input_video"=>"/videos/video.avi", "controller"=>"jobs"}
      JobFactory.should_receive(:create_job).with(@params_video)
      post :create, :input_video => '/videos/video.avi'
    end
  end
end
