class HQueue
  attr_accessor :elements, :size

  def initialize(size)
    @elements = Array.new
    @size = size
  end

  def add_element(el)
    # check if @elements includes el
    # if it does and it is the last element, don't push
    # if it does and it is not the last element, push, but delete it from the element array

    if @elements.include?(el)
      @elements.delete(el)
      @elements.push(el)
    else
      @elements.push(el)
    end
    resize
  end

  def recent_elements
    @elements.reverse
  end

  def resize
    if @elements.count > @size
      @elements.shift(1)
    end
  end
end

