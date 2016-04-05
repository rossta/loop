require "rails_helper"

describe Channel do
  let(:channel) { Channel.new }

  it "must be valid" do
    expect(channel).to be_valid
  end
end
