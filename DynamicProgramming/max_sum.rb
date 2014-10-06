require 'benchmark'
# Given an array of integers, find the subset with the maximum sum, where
# the subset does not contain adjacent numbers.
#  E.g. given [6, 4, 5, 7, 1]
#  max subset would be  [6,7]

# Brute force solution
$brute_force_steps = 0
def brute_force array, current=nil
$brute_force_steps += 1
  if current == nil
    return [brute_force(array,0), brute_force(array,1)].max
  end
  left_child = current + 2
  right_child = current + 3
  if not array[left_child]
    array[current]
  elsif not array[right_child]
    array[left_child] + array[current]
  else
    left = brute_force(array, left_child)
    right = brute_force(array, right_child)
    [left, right].max + array[current]
  end
end
# Dynamic solution

def max_subset array
  first = array[0]
  second = [array[1], first].max
  i = 2
  sums = []
  sums.push first, second
  while i < array.length
    current = sums [i-2] + array[i]
    previous = sums[i-1]
    if current > previous
      sums.push current
    else
      sums.push previous
    end
    i += 1
  end
  #p sums
  sums.last
end
if $0 == __FILE__
  test = [6, 1, 5, 7, 0, 16, 12, 3, 2, 8, 123, 7, 2, 3, 39, 5, 22, 6, 1, 6, 8, 345, 2, 3, 16, 9, 123, 1, 1, 5, 8, 2]
  Benchmark.bm do |x|
    x.report { brute_force test }
    p $brute_force_steps
    x.report { max_subset test }
  end

end
