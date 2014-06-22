# Ruby implementation of Binary tree
#
class HTree
  attr_accessor :root
  def initialize
    @root = Node.new
  end

  class Node
    attr_accessor :key, :value
    def initialize(key=nil, value=nil)
      @key = key
      @value = value
    end

    def left
      Node.new()
    end

  end
  
end
