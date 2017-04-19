FactoryGirl.define do

  sequence(:date, (10..30).cycle) do |n|
    "2016-1-#{n}"
  end

  sequence(:provider_name, (["AOL", "Gmail", "Yahoo", "Hotmail"].cycle)) do |n|
    "#{n}"
  end

  factory :provider do
    date
    provider_name
  end
end
