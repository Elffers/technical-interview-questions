require 'Benchmark'
# You have a list [5,4,12,5,3,...n], return a list such that the first
# element is the multiplication of all the elements in the list EXCEPT
# the first, the second is a multiplication of all the elements EXCEPT
# the second. Do it in O(n), and do not use division operation.

# O(n**2), because .index takes linear time to complete
# Also inefficient (O(n**2)) space, since the array is copied at each iteration

def product_map(array)
  array.map do |el|
    el_index = array.index el
    a = array.dup
    a.delete_at el_index
    a.reduce(:*)
  end
end

# O(n) time complexity
# O(n) space complexity

def product_map2(array)
  product = array.reduce(:*)
  array.map do |el|
    product / el
  end
end

n = 50000
Benchmark.bm do |x|
  x.report { n.times do; product_map [1, 4, 2, 3, 7, 8]; end }
  x.report { n.times do; product_map2 [1, 4, 2, 3, 7, 8]; end }
end
