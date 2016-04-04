class ChannelSerializer < ActiveModel::Serializer
  cache key: "channel"
  attributes :name

  has_many :posts
end
