class Account < ActiveRecord::Base
  validates :provider, presence: true
  validates :uid, presence: true
  validates :name, presence: true

  has_many :time_slots, inverse_of: :account

  def client
    self.class.const_get("#{provider}_client".camelize).new(self)
  end
end
