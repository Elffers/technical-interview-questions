class HQueue
  attr_accessor :elements

  def initialize(size)
    @elements = Array.new
    @size = size
  end

  def add_element(el)
    if el != @elements.last
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

