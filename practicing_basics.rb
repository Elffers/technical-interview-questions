# Playing with string.next - returns the next n entries of a 'dictionary'

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

  def reverse
    return @str if @str.length == 1
    array = @str.chars
    rev = []
    last_index = array.length - 1
    while last_index >= 0
      rev.push array[last_index]
      last_index -=1
    end
    rev.join
  end
end

# Pairing with @ElizabethU
def reverse_order(string)
  rev_order = []
  str_array = string.split
  last_index = str_array.length - 1
  len = str_array.length
  len.times do
    rev_order << str_array[last_index]
    last_index -= 1
  end
  rev_order.join(' ')
end
