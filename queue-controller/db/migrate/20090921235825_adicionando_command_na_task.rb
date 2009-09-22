class AdicionandoCommandNaTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :command, :text
  end

  def self.down
    remove_column :tasks, :command
  end
end
