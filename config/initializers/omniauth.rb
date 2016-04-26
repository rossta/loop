Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV.fetch('TWITTER_CONSUMER_KEY'), ENV.fetch('TWITTER_CONSUMER_SECRET'), {
    secure_image_url: 'true',
    image_size: 'original'
  }
end

require "accounts/warden_strategy"
