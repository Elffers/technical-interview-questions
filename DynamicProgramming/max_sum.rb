require 'benchmark'
# Given an array of integers, find the subset with the maximum sum, where
# the subset does not contain adjacent numbers.

# Brute force solution

def max array
  sums = []
  array.each_with_index do |n, i|


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
  p sums
  sums.last
end

