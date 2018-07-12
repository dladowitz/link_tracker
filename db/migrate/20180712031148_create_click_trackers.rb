class CreateClickTrackers < ActiveRecord::Migration[5.2]
  def change
    create_table :click_trackers do |t|
      t.string :email
      t.datetime :clicked_on_at
      t.datetime :sent_on
      t.boolean :send_immediately

      t.belongs_to :experiment

      t.timestamps
    end
  end
end
