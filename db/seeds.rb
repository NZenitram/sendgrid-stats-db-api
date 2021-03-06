require 'csv'
Provider.destroy_all
GlobalStat.destroy_all
ProviderPercentage.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'raw_response.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  prov = Provider.new
  prov.date          = row['date']
  prov.provider_name = Provider.new.fix_provider_names(row['provider'])
  prov.blocks        = row['blocks']
  prov.bounces       = row['bounces']
  prov.clicks        = row['clicks']
  prov.deferred      = row['deferred']
  prov.delivered     = row['delivered']
  prov.drops         = row['drops']
  prov.opens         = row['opens']
  prov.spam_reports  = row['spam_reports']
  prov.unique_clicks = row['unique_clicks']
  prov.unique_opens  = row['unique_opens']
  prov.user_id       = 18
  prov.utc_date      = Provider.new.convert_date_time(row['date'])
  prov.save
  puts "#{prov.provider_name}, #{prov.utc_date} saved."

  percent = ProviderPercentage.new
  percent.date = row['date']
  percent.provider_name = Provider.new.fix_provider_names(row['provider'])
  percent.open_percentage = (row["opens"].to_f / row["delivered"].to_f).round(4) * 100
  percent.click_percentage = (row["clicks"].to_f / row["delivered"].to_f).round(4) * 100
  percent.spam_report_percentage = (row["spam_reports"].to_f / row["delivered"].to_f).round(4) * 100
  percent.utc_date = Provider.new.convert_date_time(row['date'])
  percent.user_id = 18
  percent.save
  puts "#{percent.provider_name}, #{percent.utc_date} saved."
end

global_text = File.read(Rails.root.join('lib', 'seeds', 'global_data.csv'))
csv_global = CSV.parse(global_text, :headers => true, :encoding => 'ISO-8859-1')
csv_global.each do |row|
  global = GlobalStat.new
  global.date = row['date']
  global.blocks = row['blocks']
  global.bounce_drops = row['bounce_drops']
  global.bounces = row['bounces']
  global.clicks = row['clicks']
  global.deferred = row['deferred']
  global.delivered = row['delivered']
  global.invalid_emails = row['invalid_emails']
  global.opens = row['opens']
  global.processed = row['processed']
  global.requests = row['requests']
  global.spam_report_drops = row['spam_report_drops']
  global.spam_reports = row['spam_reports']
  global.unique_clicks = row['unique_clicks']
  global.unique_opens = row['unique_opens']
  global.unsubscribe_drops = row['unsubscribe_drops']
  global.unsubscribes = row['unsubscribes']
  global.utc_date = GlobalStat.new.convert_date_time(row['date'])
  global.user_id = 18
  global.save
  puts "#{global.date}, #{global.utc_date} saved."
end


puts "There are now #{Provider.count} rows in the providers table"
puts "There are now #{ProviderPercentage.count} rows in the providers percentage table"
puts "There are nw #{GlobalStat.count} row in the global stats table."
