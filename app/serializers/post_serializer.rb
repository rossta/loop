class PostSerializer < ActiveModel::Serializer
  cache key: "post"
  attributes :text

  belongs_to :channel
  has_many :slots
end
