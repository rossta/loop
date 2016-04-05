require "rails_helper"

describe Account do
  let(:account) { Account.new(provider: 'twitter', uid: 'abcd', name: 'Ross K') }

  it "requires name" do
    account.name = nil

    expect(account).to_not be_valid

    account.name = 'rossta'

    expect(account).to be_valid
  end

  it "requires uid" do
    account.uid = nil

    expect(account).to_not be_valid

    account.uid = 'abcd'

    expect(account).to be_valid
  end

  it "requires provider" do
    account.provider = nil

    expect(account).to_not be_valid

    account.provider = 'twitter'

    expect(account).to be_valid
  end
end
