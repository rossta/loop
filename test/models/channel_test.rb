require "test_helper"

describe Channel do
  let(:channel) { Channel.new }

  it "must be valid" do
    value(channel).must_be :valid?
  end
end
