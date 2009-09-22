class AdicionandoDependenciasEntreTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks_dependencies , :id => false do |t|
      t.integer :task_id
      t.integer :dependency_id
    end
  end

  def self.down
    drop_table :tasks_dependencies
    add_column :tasks, :task_id , :integer
  end
end
