class Provider < ApplicationRecord

  def convert_date_time(date)
    date.to_datetime.strftime('%Q').to_i
  end
end
