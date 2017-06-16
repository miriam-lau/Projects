class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next = nil
    self.prev = nil
    self
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    empty? ? nil : @head.next
  end

  def last
    empty? ? nil : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |link| return link.val if link.key == key }
    nil
  end

  def include?(key)
    any? { |link| link.key == key }
  end

  def append(key, val)
    new_link = Node.new(key, val)
    @tail.prev.next = new_link
    new_link.prev = @tail.prev
    new_link.next = @tail
    @tail.prev = new_link

    new_link
  end

  def update(key, val)
    self.each do |link|
      if link.key == key
        link.val = val
        return link;
      end
    end
  end

  def remove(key)
    self.each do |link|
      if link.key == key
        link.remove
        return link.val
      end
    end

    nil
  end

  def each
    current_link = @head.next
    until current_link == @tail
      yield current_link
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
