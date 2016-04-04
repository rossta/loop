class Slot < ActiveRecord::Base
  belongs_to :post, inverse_of: :slots
  belongs_to :schedulable, inverse_of: :slots

  after_commit :enqueue_broadcast, if: :publishable?

  def publishable?
    self.publish_at.present? && unpublished?
  end

  def published?
    self.published_at.present?
  end

  def unpublished?
    !published?
  end

  def broadcast(timestamp = self.publish_at)
    raise Loop::SlotBroadcastError.new unless timestamp.to_i == publish_int

    with_lock do
      update_attribute(:published_at, Time.zone.now)
    end

    Rails.logger.info("Successful broadcast: #{slot}")
    true
  end

  def requeue_at(publish_at)
    return false if unpublished?
    return false if publish_at < Time.zone.now

    Slot.create(post: post, publish_at: publish_at)
  end

  def publish_int
    publish_at.presence && publish_at.to_i
  end

  private

  def enqueue_broadcast
    return false if published?

    SlotBroadcastJob.set(wait_until: self.publish_at).
      perform_later(self, self.publish_int)
  end
end
