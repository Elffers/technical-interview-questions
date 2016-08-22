# Given a sorted list of integers, find a way to split the list into two such that
# the sum of the elements in the two new lists are as close as possible

def balance array
  # Start from the highest number, put that in its own array
  # Iterate backwards, compare value of element against sum.
  foo = []
  bar = []
  foo << array.pop

  while !array.empty?
    el = array.pop
    lighter = choose_lighter foo, bar
    lighter << el
  end

  p 'foo' => sum(foo), 'bar' => sum(bar)

  [foo, bar]
end

def sum array
  sum = array.reduce(:+)
  sum.nil? ? 0 : sum
end

def choose_lighter ary1, ary2
  sum(ary1) < sum(ary2) ? ary1 : ary2
end
