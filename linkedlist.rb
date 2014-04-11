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
    while current.next
      output << current.value
      current = current.next
    end
    output << current.value
    output
  end
end

class Node

  attr_accessor :value, :next

  def initialize(value, pointer)
    @value = value
    @next = pointer
  end

end