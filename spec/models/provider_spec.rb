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
      date = "2017-1-03"
      utc = Provider.new.convert_date_time(date)

      prov = build(:provider, date: date, utc_date: utc)

      prov.save

      expect(Provider.all.first.date).to eq(prov.date)
    end
    it 'should not save without a date' do
      date = "2017-1-03"
      utc = Provider.new.convert_date_time(date)

      prov = build(:provider)

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
    it 'should not save without a provider name' do
      prov = build(:provider, provider_name: nil, date: "2016-1-01")

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
    it 'should not save without blocks' do
      prov = build(:provider, blocks: nil, date: "2016-1-01")

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
    it 'should not save without bounces' do
      prov = build(:provider, bounces: nil, date: "2016-1-01")

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
    it 'should not save without blocks' do
      prov = build(:provider, blocks: nil, date: "2016-1-01")

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
    it 'should not save without clicks' do
      prov = build(:provider, clicks: nil, date: "2016-1-01")

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
    it 'should not save without deferred' do
      prov = build(:provider, deferred: nil, date: "2016-1-01")

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
    it 'should not save without delivered' do
      prov = build(:provider, delivered: nil, date: "2016-1-01")

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
    it 'should not save without drops' do
      prov = build(:provider, drops: nil, date: "2016-1-01")

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
    it 'should not save without opens' do
      prov = build(:provider, opens: nil, date: "2016-1-01")

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
    it 'should not save without spam_reports' do
      prov = build(:provider, spam_reports: nil, date: "2016-1-01")

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
    it 'should not save without unique_clicks' do
      prov = build(:provider, unique_clicks: nil, date: "2016-1-01")

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
    it 'should not save without unique_opens' do
      prov = build(:provider, unique_opens: nil, date: "2016-1-01")

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
    it 'should not save without a user_id' do
      prov = build(:provider, user_id: nil, date: "2016-1-01")

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
    it 'should not save without a UTC date' do
      date = "2017-1-03"
      utc = Provider.new.convert_date_time(date)

      prov = build(:provider, date: "2016-1-01")

      provider = prov.save

      expect(provider).to eq(false)
      expect(Provider.first).to eq(nil)
    end
  end
end
