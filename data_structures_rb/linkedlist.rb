# Singly linked list

class LinkedList

  class EmptyError < RuntimeError
  end

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

  # Inserts a new node in order from greatest to least

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

  # Removes and returns the first value in the list
  def pop
    if self.empty?
      raise EmptyError
    else
      value = @head.value
      @head = @head.next
      value
    end
  end

  # Returns true if list is empty.
  def empty?
    @head == nil
  end

end

class Node

  attr_accessor :value, :next

  def initialize(value, pointer)
    @value = value
    @next = pointer
  end

end