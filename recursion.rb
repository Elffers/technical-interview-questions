def sum(array)
  first = array[0]
  if array.length == 1
    first
  else
    first + sum(array[1..-1])
  end
end

def reverse(string)
  if string.length == 1
    string
  else
    string[-1] + reverse(string.chop)
  end
end

