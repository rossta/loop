DatabaseCleaner.strategy = :transaction

DatabaseCleaner[:redis, {:connection => ENV.fetch("REDIS_URL")}].strategy = :truncation

class Minitest::Spec
  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end
