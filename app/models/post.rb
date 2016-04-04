class Post < ActiveRecord::Base
  belongs_to :channel, inverse_of: :posts
  has_many :slots, inverse_of: :post
end
