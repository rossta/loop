require "rails_helper"

describe SlotBroadcastJob do
  describe "#perform" do
    let(:slot) { double }

    it "broadcasts slot" do
      expect(slot).to receive(:broadcast)

      SlotBroadcastJob.new.perform(slot, 123)
    end

    it "fails silently with wrong timestamp" do
      expect(slot).to receive(:broadcast).and_raise Loop::SlotBroadcastError

      expect { SlotBroadcastJob.new.perform(slot, 123) }.not_to raise_error
    end
  end
end
