class ClickTracker < ApplicationRecord
  belongs_to :experiment

  validates :send_immediately, presence: true
end
