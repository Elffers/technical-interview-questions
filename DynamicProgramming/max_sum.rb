require 'benchmark'
# Given an array of integers, find the subset with the maximum sum, where
# the subset does not contain adjacent numbers.
#  E.g. given [6, 4, 5, 7, 1]
#  max subset would be  [6,7]

# Brute force solution

def brute_force array, current=nil
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
  sums.last
end

if $0 == __FILE__
  test1 = (1..30).to_a.shuffle
  test2 = (1..60).to_a.shuffle
  Benchmark.bm do |x|
    puts "brute force"
    x.report { brute_force test1 }
    x.report { brute_force test2 }
    puts "dynamic"
    x.report { max_subset test1 }
    x.report { max_subset test2 }
  end

end
