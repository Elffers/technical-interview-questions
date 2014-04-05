class HQueue
  attr_accessor :elements

  def initialize
    @elements = []
  end

  def add_element(el)
    @elements << el
    @elements
  end

  def count
    @elements.count
  end

  def most_recent(num)
    @elements[-num..-1]
  end

end

