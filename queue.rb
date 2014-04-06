class HQueue
  attr_accessor :most_recent, :second_most_recent, :elements

  def initialize(elements=[])
    @elements = Array.new(elements)
  end

  def add_element(el)
    @elements << el
    if el != @most_recent
      @second_most_recent = @most_recent
      @most_recent = el
    end
  end

  def recent_elements(n)
    @elements[-n..-1].reverse
  end
end

