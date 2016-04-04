class BroadcastJob
  include Sidekiq::Worker

  def perform(time_slot_id)
    time_slot = TimeSlot.find(time_slot_id)
    time_slot.channel_broadcast
  end
end
