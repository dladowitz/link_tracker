class AddPercentImmediateToExperiment < ActiveRecord::Migration[5.2]
  def change
    add_column :experiments, :percent_immediate, :float
    add_column :experiments, :percent_interval, :float
  end
end
