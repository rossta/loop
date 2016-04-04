class Account < ActiveRecord::Base
  validates :provider, presence: true
  validates :uid, presence: true
  validates :name, presence: true

  def client
    self.class.const_get("#{provider}_client".camelize).new(self)
  end
end
