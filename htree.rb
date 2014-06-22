# Ruby implementation of Binary tree
#
class HTree
  attr_accessor :root
  # right now only works for two nodes.
  # needs a way to find where to insert the new node
  # recursive way?

  def insert(key, value)
    child = Node.new(key, value)
    if !@root
      @root = child
    elsif @root.key < child.key
      @root.right = child
    elsif @root.key > child.key
      @root.left = child
    end
  end

  class Node
    attr_accessor :key, :value, :left, :right
    def initialize(key=nil, value=nil)
      @key = key
      @value = value
    end
  end
  
end
