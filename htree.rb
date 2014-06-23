# Ruby implementation of Binary tree
#
class HTree
  attr_accessor :root
  # right now only works for two nodes.
  # needs a way to find where to insert the new node
  # recursive way?

  def insert(key, value)
    child = Node.new(key, value)
    # this is to set the initial node if the tree is empty
    if !@root
      @root = child
    # needs to traverse the children to find correct insertion point
    elsif @root.key < child.key
      self.right_insert(child)
    elsif @root.key > child.key
      self.left_insert(child) 
    end
  end
  # method to keep going down the left or right sides to insert nodes properly
  def left_insert(node)
    current = @root
    if not current.left
      current.left = node
    else
      while node.key < current.key && current.left
         current  = current.left
      end
      current.left = node
    end
  end

  def right_insert(node)
    current = @root
    if not current.right
      current.right = node
    else
      while node.key > current.key && current.right
         current  = current.right 
      end
      current.right = node
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
