class HQueue
  attr_accessor :elements, :size

  def initialize(size)
    @elements = Array.new
    @size = size
  end

  def add_element(el)
    if not @elements.include?(el)
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

