# Playing with .next

def next_n_entries(string, iterations)
  array = []
  iterations.times do
    string = string.next
    array.push string
  end
  array
end

# Writing .reverse from scratch
class HString
  def initialize(str)
    @str = str
  end

  def hreverse
    return @str if @str.length == 1
  end
end

