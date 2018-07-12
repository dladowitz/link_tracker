class Experiment < ApplicationRecord
  has_many :click_trackers, dependent: :destroy

  validates :wait_interval_days, :survey_link, presence: true
end
