class Provider < ApplicationRecord
  validates :date, presence: true
  validates :provider_name, presence: true
  validates :blocks, presence: true
  validates :clicks, presence: true
  validates :deferred, presence: true
  validates :delivered, presence: true
  validates :drops, presence: true
  validates :opens, presence: true
  validates :spam_reports, presence: true
  validates :unique_clicks, presence: true
  validates :unique_opens, presence: true
  validates :user_id, presence: true
  
  def convert_date_time(date)
    date.to_datetime.strftime('%Q').to_i
  end
end
