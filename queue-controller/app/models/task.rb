class Task < ActiveRecord::Base
  belongs_to :job
  has_and_belongs_to_many :dependencies, :join_table => "tasks_dependencies", :class_name => "Task", :foreign_key => "dependency_id"
end
