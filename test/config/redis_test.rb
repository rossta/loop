require 'test_helper'

describe "Redis configuration" do
  it "uses REDIS_URL" do
    ENV.fetch("REDIS_URL").must_equal "redis://localhost:6379/8"
  end

  it "sets up sidekiq" do
    redis_url = Sidekiq::RedisConnection.__send__(:determine_redis_provider)
    redis_url.must_equal "redis://localhost:6379/8"
  end
end
