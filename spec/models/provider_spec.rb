require 'rails_helper'

RSpec.describe Provider, type: :model do
  context 'Model converts date to UTC date time' do
    it 'converts 2017-1-03 to 1483401600000 ' do

    date = "2017-1-03"

    utc = Provider.new.convert_date_time(date)

    expect(utc).to eq(1483401600000)
    end
  end
end
