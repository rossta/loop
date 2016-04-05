require 'rails_helper'

describe "Redis configuration" do
  it "uses REDIS_URL" do
    expect(ENV.fetch("REDIS_URL")).to eq "redis://localhost:6379/8"
  end

  it "sets up sidekiq" do
    redis_url = Sidekiq::RedisConnection.__send__(:determine_redis_provider)
    expect(redis_url).to eq "redis://localhost:6379/8"
  end
end
