class HQueue
  attr_accessor :elements

  def initialize
    @elements = Array.new
  end

  def add_element(el)
    if el != @elements.last
      @elements << el
      if @elements.count > 2
        @elements = @elements.pop(2)
      end
    end
  end

  def recent_elements
    @elements.reverse
  end
end

