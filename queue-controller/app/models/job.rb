class Job < ActiveRecord::Base
  has_many :tasks
end
