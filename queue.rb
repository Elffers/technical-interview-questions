class HQueue
  attr_accessor :elements, :most_recent, :second_most_recent

  def initialize
    @elements = []
  end

  def add_element(el)
    @elements << el
    @most_recent = el
    @second_most_recent = @elements[-2]
    @elements
  end

  def count
    @elements.count
  end

  # def most_recent(num)
  #   @elements[-num..-1]
  # end

end

