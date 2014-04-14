# Singly linked list

class LinkedList

  attr_accessor :head

  def initialize(value, pointer)
    @head = Node.new(value, pointer)
  end

  def cons(value)
    added = Node.new(value, @head)
    @head = added
  end

  def to_a
    current = @head
    output = []
    return [] unless current
    while current.next
      output << current.value
      current = current.next
    end
    output << current.value
    output
  end

  def insert(value)
    current = @head
    previous = nil
    while current && value <= current.value
      previous = current
      current = current.next
    end
    if previous
      previous.next = Node.new(value, current)
    else
      cons(value)
    end
    self
  end

  def pop
    value = @head.value
    @head = @head.next
    value
  end
end

class Node

  attr_accessor :value, :next

  def initialize(value, pointer)
    @value = value
    @next = pointer
  end

end