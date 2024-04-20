class Todo < ApplicationRecord
  validates :title, presence: true
  validates :daily_summary_id, presence: true

  belongs_to :daily_summary
end
