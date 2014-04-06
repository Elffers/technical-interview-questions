class HQueue
  attr_accessor :elements

  def initialize
    @elements = Array.new
  end

  def add_element(el)
    if el != @elements.last
      @elements.push(el)
      if @elements.count > 2
        @elements.shift(1)
      end
    end
  end

  def recent_elements
    @elements.reverse
  end
end

