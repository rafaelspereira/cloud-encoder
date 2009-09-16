class JobsController < ApplicationController

  def create
    JobFactory.create_job(params)
  end

end
