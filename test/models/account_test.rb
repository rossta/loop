require "test_helper"

describe Account do
  let(:account) { Account.new(provider: 'twitter', uid: 'abcd', name: 'Ross K') }

  it "requires name" do
    account.name = nil

    value(account).wont_be :valid?

    account.name = 'rossta'

    value(account).must_be :valid?
  end

  it "requires uid" do
    account.uid = nil

    value(account).wont_be :valid?

    account.uid = 'abcd'

    value(account).must_be :valid?
  end

  it "requires provider" do
    account.provider = nil

    value(account).wont_be :valid?

    account.provider = 'twitter'

    value(account).must_be :valid?
  end
end
