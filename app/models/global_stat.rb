class GlobalStat < ApplicationRecord
  validates :date, presence: true
  validates :blocks, presence: true
  validates :bounce_drops, presence: true
  validates :bounces, presence: true
  validates :clicks, presence: true
  validates :deferred, presence: true
  validates :delivered, presence: true
  validates :invalid_emails, presence: true
  validates :opensprocessed, presence: true
  validates :requests, presence: true
  validates :spam_report_drops, presence: true
  validates :spam_reports, presence: true
  validates :unique_clicks, presence: true
  validates :unique_opens, presence: true
  validates :unsubscribe_drops, presence: true
  validates :unsubscribes, presence: true
  validates :utc_date, presence: true
  validates :user_id, presence: true

  def convert_date_time(date)
    date.to_datetime.strftime('%Q').to_i
  end
end
