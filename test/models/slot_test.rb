require "test_helper"

describe Slot do
  let(:slot) { Slot.new }

  it "must be valid" do
    value(post_event).must_be :valid?
  end
end
