require "test_helper"

describe BroadcastJob do
  describe "#perform" do
    it "finds time_slot and broadcasts schedulable content" do
      channel = create(:channel)
      post = create(:post, channel: channel)
      time_slot = create(:time_slot, channel: channel)

      post.events.count.must_equal 0

      job = BroadcastJob.new
      job.perform(time_slot)

      post.events.count.must_equal 1
    end
  end
end
