class AdicionandoTasksNoJob < ActiveRecord::Migration
  def self.up
    add_column :tasks, :job_id , :integer
  end

  def self.down
    remove_column :tasks, :job_id
  end
end
