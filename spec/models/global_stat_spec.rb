require 'rails_helper'

RSpec.describe GlobalStat, type: :model do
  context 'Model converts date to UTC date time' do
    it 'converts 2017-1-03 to 1483401600000 ' do

    date = "2017-1-03"
    utc = GlobalStat.new.convert_date_time(date)

    expect(utc).to eq(1483401600000)
    end
  end
  context 'validation testing' do
    it 'should save with all data' do
      date = "2017-1-03"
      utc = GlobalStat.new.convert_date_time(date)

      global = build(:global_stat, date: date, utc_date: utc)

      global.save

      expect(GlobalStat.all.first.date).to eq(global.date)
    end
    it 'should not save without a date' do
      date = "2017-1-03"
      utc = GlobalStat.new.convert_date_time(date)

      global = build(:global_stat)

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without blocks' do
      global = build(:global_stat, blocks: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without bounce_drops' do
      global = build(:global_stat, bounce_drops: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without bounces' do
      global = build(:global_stat, bounces: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without clicks' do
      global = build(:global_stat, clicks: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without deferred' do
      global = build(:global_stat, deferred: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without delivered' do
      global = build(:global_stat, delivered: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without invalid_emails' do
      global = build(:global_stat, invalid_emails: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without opensprocessed' do
      global = build(:global_stat, opensprocessed: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without requests' do
      global = build(:global_stat, requests: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without spam_report_drops' do
      global = build(:global_stat, spam_report_drops: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without spam_reports' do
      global = build(:global_stat, spam_reports: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without unique_clicks' do
      global = build(:global_stat, unique_clicks: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without unique_opens' do
      global = build(:global_stat, unique_opens: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without unsubscribe_drops' do
      global = build(:global_stat, unsubscribe_drops: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without unsubscribes' do
      global = build(:global_stat, unsubscribes: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without utc_date' do
      global = build(:global_stat, utc_date: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end
    it 'should not save without user_id' do
      global = build(:global_stat, user_id: nil, date: "2016-1-01")

      global_stat = global.save

      expect(global_stat).to eq(false)
      expect(GlobalStat.first).to eq(nil)
    end

  end
end
