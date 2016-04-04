#
# LoopQueue.new(AccountQueue.new(account))
# LoopQueue.new(Channel.new(channel))
#
class LoopQueue
  extend Forwardable

  def_delegators :@list, :size, :length, :empty?

  def initialize(list = [])
    wrap list
  end

  def pop
    @cycle ||= @list.cycle
    @cycle.next
  end
  alias_method :shift, :pop
  alias_method :deq, :pop

  def push(item)
    @list.push(item)
  end
  alias_method :<<, :push
  alias_method :enq, :push

  def clear
    wrap []
  end

  def wrap(list)
    @list = list
  end
end
