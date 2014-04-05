class HQueue
  attr_accessor :elements, :most_recent, :second_most_recent

  def initialize(elements=[])
    Array.new(elements)
    @elements = elements
    @most_recent ||= @elements.last
  end

  def add_element(el)
    @elements << el
    @most_recent = el
    @elements
  end

  def count
    @elements.count
  end

end

