require "rails_helper"

describe Slot do
  let(:slot) { Slot.new }

  it "must be valid" do
  end

  describe "#broadcast" do
    it "fails without publish_at" do
      slot.publish_at = nil
      expect{ slot.broadcast }.to raise_error(Loop::SlotBroadcastError)
    end

    it "fails when given publish_at does not match" do
      timestamp = 1.hour.from_now
      slot.publish_at = timestamp
      expect{ slot.broadcast(at: (timestamp + 1.hour)) }.to raise_error(Loop::SlotBroadcastError)
    end

    it "fails when given timestamp is in the future" do
      Timecop.freeze do
        slot.publish_at = 1.second.from_now
        expect{ slot.broadcast }.to raise_error(Loop::SlotBroadcastError)
      end
    end

    it "publishes the slot" do
      Timecop.freeze do
        slot.publish_at = Time.zone.now
        slot.broadcast
        expect(slot.published_at).to eq Time.zone.now
      end
    end

    it "publishes the slot with force: true" do
      Timecop.freeze do
        slot.publish_at = nil
        slot.broadcast(force: true)
        expect(slot.published_at).to eq Time.zone.now
      end
    end

    it "publishes the slot with the appropriate timestamp" do
      Timecop.freeze do
        slot.publish_at = 1.second.ago
        slot.broadcast(at: 1.second.ago)
        expect(slot.published_at).to eq Time.zone.now
      end
    end
  end
end
