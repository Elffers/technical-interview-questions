# http://en.wikipedia.org/wiki/Linked_list
# singly linked is fine
# each node should contain a string
# and of course, the pointer to the next node
# there should be a nil or none value in ruby you can use at the end of the lust where you would normally put the next item
# so I'm looking for two things:
# 1. A function to add an item to the list so that the items stay sorted in ascending order
# 2. A function to print each item in the list, one on each line
# I'll be around tonight if you have questions :-)
# also, end of the list

class LinkedList

  attr_accessor :head

  def initialize(string, value)
    @head = Node.new(string, value)
  end

end

class Node

  attr_accessor :value, :next

  def initialize(string, pointer)
    @value = string
    @next = pointer
  end

end