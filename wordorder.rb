# Reverse the word order of a string and then reverse then letters in each word.

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
