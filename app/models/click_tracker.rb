class ClickTracker < ApplicationRecord
  belongs_to :experiment

  validates_inclusion_of :send_immediately, :in => [true, false]
end
