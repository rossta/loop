FactoryGirl.define do
  factory :account do
    provider "twitter"
    uid { SecureRandom.uuid }
    name "Ross Boss"
    email "ross@example.com"
    nickname "rossboss"
    first_name "Ross"
    last_name "Boss"
    location "New York City"
    description "My account"
    image ""
    phone ""
    token { SecureRandom.hex }
    secret { SecureRandom.hex }
  end
end
