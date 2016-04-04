class BroadcastJob
  include Sidekiq::Worker

  def perform(time_slot_id)
    time_slot = TimeSlot.find(time_slot_id)
    time_slot.channel_broadcast
  end
end

# As ActiveJob
# class BroadcastJob < ActiveJob::Base
#   queue_as :broadcast
#
#   # A schedulable, such as a post or channel, responds to `#broadcast`
#   def perform(schedulable)
#     schedulable.broadcast
#     # Do something later
#   end
# end
