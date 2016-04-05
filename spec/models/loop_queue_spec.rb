require "rails_helper"

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
      expect(queue.pop).to eq 1
      expect(queue.pop).to eq 2
      expect(queue.pop).to eq 3
      expect(queue.size).to eq 3

      expect(queue.pop).to eq 1
      expect(queue.pop).to eq 2
      expect(queue.pop).to eq 3
      expect(queue.size).to eq 3

      expect(queue.pop).to eq 1
      expect(queue.pop).to eq 2
      expect(queue.size).to eq 3
    end

    it "aliases #shift and #deq" do
      expect(queue.pop).to eq 1
      expect(queue.shift).to eq 2
      expect(queue.deq).to eq 3
    end
  end

  describe "#push" do
    let(:queue) { LoopQueue.new([1]) }

    it "appends item" do
      expect(queue.size).to eq 1

      queue.push 10

      expect(queue.size).to eq 2

      expect(queue.pop).to eq 1
      expect(queue.pop).to eq 10
    end

    it "pops indefinitely after pushing" do
      queue.push 10

      expect(queue.pop).to eq 1
      expect(queue.pop).to eq 10
      expect(queue.size).to eq 2

      expect(queue.pop).to eq 1
      expect(queue.pop).to eq 10
      expect(queue.size).to eq 2
    end

    it "aliases #<< and #enq" do
      queue << 2
      queue.enq 3

      expect(queue.pop).to eq 1
      expect(queue.pop).to eq 2
      expect(queue.pop).to eq 3
    end
  end

  describe "#empty?" do
    it "when it wraps nothing" do
      expect(LoopQueue.new).to be_empty
    end

    it "when it wraps empty" do
      expect(LoopQueue.new([])).to be_empty
    end

    it "otherwise wont be" do
      expect(LoopQueue.new([1])).to_not be_empty
    end
  end

  describe "#clear" do
    it "unsets list" do
      list = [1, 2, 3]
      queue = LoopQueue.new(list)

      queue.clear

      expect(queue).to be_empty
      expect(list.size).to eq 3
    end
  end

  describe "#wrap" do
    it "sets list" do
      list = [1, 2, 3]
      queue = LoopQueue.new

      queue.wrap list

      expect(queue.size).to eq 3
    end
  end
end
