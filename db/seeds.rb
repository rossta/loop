default_twitter_uid = ENV.fetch('TWITTER_UID')
account = Account.find_or_initialize_by uid: default_twitter_uid, provider: 'twitter'
account.token = ENV.fetch('TWITTER_ACCESS_TOKEN')
account.secret = ENV.fetch('TWITTER_ACCESS_SECRET')
account.nickname = ENV.fetch('TWITTER_NICKNAME')
account.name = ENV.fetch('TWITTER_NICKNAME')
account.save!

Slot.destroy_all
Post.destroy_all

channel = Channel.find_or_create_by name: 'Tech'
account.client.timeline.take(100).each do |tweet|
  Post.find_or_create_by(text: tweet.text) do |post|
    post.channel = channel
  end
end

slot_time = Time.zone.now
posts = Post.find_each.cycle
250.times do
  Slot.create(post: posts.next, publish_at: slot_time+=5.minutes)
end
