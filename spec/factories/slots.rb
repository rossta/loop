FactoryGirl.define do
  factory :slot do
    post
    publish_at 1.hour.from_now
    published_at nil
  end
end
