require "rails_helper"

describe Schedule do
  let(:schedule) { Schedule.new }

  it "must be valid" do
    expect(schedule).to be_valid
  end
end
