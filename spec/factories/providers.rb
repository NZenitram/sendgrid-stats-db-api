FactoryGirl.define do

  sequence(:provider_name, (["AOL", "Gmail", "Yahoo", "Hotmail"].cycle)) do |n|
    "#{n}"
  end

  sequence(:blocks) do |n|
    rand(10)
  end

  sequence(:bounces) do |n|
    rand(15)
  end

  sequence(:clicks) do |n|
    rand(1000)
  end

  sequence(:deferred) do |n|
    rand(100)
  end

  sequence(:delivered) do |n|
    rand(2000)
  end

  sequence(:drops) do |n|
    rand(20)
  end

  sequence(:opens) do |n|
    rand(400)
  end

  sequence(:spam_reports) do |n|
    rand(10)
  end

  sequence(:unique_clicks) do |n|
    rand(100)
  end

  sequence(:unique_opens) do |n|
    rand(250)
  end

  sequence(:user_id) do |n|
    rand(1..5)
  end

  factory :provider do
    provider_name
    blocks
    bounces
    clicks
    deferred
    delivered
    drops
    opens
    spam_reports
    unique_clicks
    unique_opens
    user_id
  end
end
