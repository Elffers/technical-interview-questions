class HQueue
  attr_accessor :most_recent, :second_most_recent

  def initialize
  end

  def add_element(el)
    @second_most_recent = @most_recent
    @most_recent = el
  end

  def recent_elements
    [@most_recent, @second_most_recent]
  end

end

