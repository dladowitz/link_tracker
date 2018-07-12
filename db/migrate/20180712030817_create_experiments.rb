class CreateExperiments < ActiveRecord::Migration[5.2]
  def change
    create_table :experiments do |t|
      t.integer :wait_interval_days
      t.string :survey_link

      t.timestamps
    end
  end
end
