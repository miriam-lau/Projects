class Link
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
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail

  def initialize
    @head = Link.new
    @tail = Link.new
    head.next = tail
    tail.prev = head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current_link = @head
    until current_link == @tail
      return current_link.val if current_link.key == key
      current_link = current_link.next
    end
    nil
  end

  def include?(key)
    current_link = @head
    until current_link == @tail
      return true if current_link.key == key
      current_link = current_link.next
    end

    false
  end

  def append(key, val)
    new_link = Link.new(key, val)
    last.next = new_link
    new_link.prev = last
    new_link.next = tail
    tail.prev = new_link
  end

  def update(key, val)
    current_link = @head
    until current_link == @tail
      if current_link.key == key
        current_link.val = val
        break
      end
      current_link = current_link.next
    end
    nil
  end

  def remove(key)
    current_link = @head
    until current_link == @tail
      if current_link.key == key
        current_link.prev.next = current_link.next
        current_link.next.prev = current_link.prev
        break
      end
      current_link = current_link.next
    end
  end

  def each
    current_link = first
    until current_link == @tail
      yield(current_link)
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
