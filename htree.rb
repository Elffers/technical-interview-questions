# Ruby implementation of Binary tree
#
class HTree
  attr_accessor :root

  def insert(key, value)
    child = Node.new(key, value)
    p child
    if !@root
      @root = child
    elsif @root.key < child.key
      p "RIGHT"
      @root.right = child
    elsif @root.key > child.key
      p "LEFT"
      p "ROOT", @root
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
