class ProviderPercentage < ApplicationRecord
  validates :date, presence: true
  validates :open_percentage, presence: true
  validates :click_percentage, presence: true
  validates :spam_report_percentage, presence: true
  validates :unsubscribe_percentage, presence: true
  validates :user_id, presence: true
  validates :utc_date, presence: true
end
