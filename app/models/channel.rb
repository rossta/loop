class Channel < ActiveRecord::Base
  has_many :time_slots, inverse_of: :channel

  has_many :posts, inverse_of: :channel
  has_many :queued_posts, -> { joins(:time_slots) }

  has_many :schedules, inverse_of: :channel
end
