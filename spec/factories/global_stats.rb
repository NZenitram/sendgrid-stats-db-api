FactoryGirl.define do

  sequence(:bounce_drops) do |n|
    rand(10)
  end

  sequence(:invalid_emails) do |n|
    rand(10)
  end

  sequence(:processed) do |n|
    rand(50)
  end

  sequence(:requests) do |n|
    rand(2250)
  end

  sequence(:spam_report_drops) do |n|
    rand(10)
  end

  sequence(:unsubscribe_drops) do |n|
    rand(10)
  end

  sequence(:unsubscribes) do |n|
    rand(10)
  end

  factory :global_stat do
    blocks
    bounce_drops
    bounces
    clicks
    deferred
    delivered
    invalid_emails
    processed
    requests
    spam_report_drops
    spam_reports
    unique_clicks
    unique_opens
    unsubscribe_drops
    unsubscribes
    user_id
  end
end
