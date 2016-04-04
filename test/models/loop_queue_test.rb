require "test_helper"

describe LoopQueue do
  #clear
  #empty?
  #length, size
  #num_waiting
  #pop, shift, deq
  #push, <<, enq

  let(:queue) { LoopQueue.new }

  describe "#pop" do
    let(:queue) { LoopQueue.new([1, 2, 3]) }

    it "pops indefinitely" do
      queue.pop.must_equal 1
      queue.pop.must_equal 2
      queue.pop.must_equal 3
      queue.size.must_equal 3

      queue.pop.must_equal 1
      queue.pop.must_equal 2
      queue.pop.must_equal 3
      queue.size.must_equal 3

      queue.pop.must_equal 1
      queue.pop.must_equal 2
      queue.size.must_equal 3
    end

    it "aliases #shift and #deq" do
      queue.pop.must_equal 1
      queue.shift.must_equal 2
      queue.deq.must_equal 3
    end
  end

  describe "#push" do
    let(:queue) { LoopQueue.new([1]) }

    it "appends item" do
      queue.size.must_equal 1

      queue.push 10

      queue.size.must_equal 2

      queue.pop.must_equal 1
      queue.pop.must_equal 10
    end

    it "pops indefinitely after pushing" do
      queue.push 10

      queue.pop.must_equal 1
      queue.pop.must_equal 10
      queue.size.must_equal 2

      queue.pop.must_equal 1
      queue.pop.must_equal 10
      queue.size.must_equal 2
    end

    it "aliases #<< and #enq" do
      queue << 2
      queue.enq 3

      queue.pop.must_equal 1
      queue.pop.must_equal 2
      queue.pop.must_equal 3
    end
  end

  describe "#empty?" do
    it "when it wraps nothing" do
      LoopQueue.new.must_be :empty?
    end

    it "when it wraps empty" do
      LoopQueue.new([]).must_be :empty?
    end

    it "otherwise wont be" do
      LoopQueue.new([1]).wont_be :empty?
    end
  end

  describe "#clear" do
    it "unsets list" do
      list = [1, 2, 3]
      queue = LoopQueue.new(list)

      queue.clear

      queue.must_be :empty?
      list.size.must_equal 3
    end
  end

  describe "#wrap" do
    it "sets list" do
      list = [1, 2, 3]
      queue = LoopQueue.new

      queue.wrap list

      queue.size.must_equal 3
    end
  end
end
