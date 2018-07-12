class Experiment < ApplicationRecord
  has_many :click_trackers, dependent: :destroy

  validates :wait_interval_days, :survey_link, presence: true

  before_create :set_percentages


  def recalculate_click_percentages
    total_click_trackers = click_trackers.count
    immediate = click_trackers.where.not(clicked_on_at: nil).where(send_immediately: true).count
    interval = click_trackers.where.not(clicked_on_at: nil).where(send_immediately: false).count
    self.percent_immediate = (immediate / total_click_trackers.to_f).round(4)
    self.percent_interval  = (interval / total_click_trackers.to_f).round(4)
    self.save
  end

  def set_percentages
    self.percent_immediate = 0
    self.percent_interval  = 0
  end
end
