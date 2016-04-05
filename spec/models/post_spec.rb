require "rails_helper"

describe Post do
  let(:post) { Post.new }

  it "must be valid" do
    expect(post).to be_valid
  end
end
