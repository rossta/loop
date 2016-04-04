require "json"
class Recurrence < SimpleDelegator
  class_attribute :delegate_class
  self.delegate_class = IceCube::Schedule

  def self.dump(recurrence)
    return recurrence if recurrence.nil? || recurrence == ""
    recurrence.to_json
  end

  def self.load(json)
    json.presence && from_json(json)
  end

  def self.from_json(json)
    delegate_class.from_hash(JSON.load(json))
  end

  def initialize(start_time = nil, options = {})
    super delegate_class.new(start_time, options)
  end

  def to_json
    to_hash.to_json
  end

  def to_s
    "#<#{self.class.name} #{to_hash.inspect}>"
  end

  def inspect
    to_s
  end
end
