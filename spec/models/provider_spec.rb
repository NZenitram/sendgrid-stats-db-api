require 'rails_helper'

RSpec.describe Provider, type: :model do
  context 'Model converts date to UTC date time' do
    it 'converts 2017-1-03 to 1483401600000 ' do

    date = "2017-1-03"

    utc = Provider.new.convert_date_time(date)

    expect(utc).to eq(1483401600000)
    end
  end

  context 'validation testing' do
    it 'should save with all data' do
      prov = build(:provider, date: "2016-1-01")

      prov.save

      expect(Provider.all.first.date).to eq(prov.date)
    end
    it 'should not save without a date' do
      prov = build(:provider)

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end

    
  end
end
