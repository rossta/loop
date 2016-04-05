class SlotBroadcastJob < ActiveJob::Base
  queue_as :broadcast

  def perform(slot, publish_at)
    slot.broadcast(at: publish_at)

  rescue Loop::SlotBroadcastError
    Rails.logger.info(
      "Could not publish slot #{slot} with timestamp #{publish_at}")
  end
end
