class HQueue
  attr_accessor :most_recent, :second_most_recent

  def initialize
  end

  def add_element(el)
    if el != @most_recent
      @second_most_recent = @most_recent
      @most_recent = el
    end
  end

  def recent_elements
    [@most_recent, @second_most_recent]
  end

end

