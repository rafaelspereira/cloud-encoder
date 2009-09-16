class AdicionandoVideoEDuracaoAoJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :input_video, :string
    add_column :jobs, :duration, :integer
  end

  def self.down
    remove_column :jobs, :input_video
    remove_column :jobs, :duration
  end
end
