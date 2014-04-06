class HQueue
  attr_accessor :most_recent, :second_most_recent, :elements

  def initialize
    @elements = Array.new
  end

  def add_element(el)
    @elements << el
    if @elements.count > 2
      @elements = @elements.pop(2)
    end
    @second_most_recent = @most_recent
    @most_recent = @elements.last
    # if el != @most_recent && @elements.count == 2
    #   # @elements = @elements.shift(1)
    #   @second_most_recent = @most_recent
    #   @most_recent = @elements.last
    # end
  end

  def recent_elements
    @elements.reverse
  end
end

