class DailySummary < ApplicationRecord
  validates :date, presence: true
  validates :todos_completed_count, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true

  belongs_to :user
  has_many :todos
end
