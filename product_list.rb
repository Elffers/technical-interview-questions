# You have a list [5,4,12,5,3,...n], return a list such that the first
# element is the multiplication of all the elements in the list EXCEPT
# the first, the second is a multiplication of all the elements EXCEPT
# the second. Do it in O(n), and do not use division operation.

def product_map(array)
  array.map do |el|
    el_index = array.index el
    a = array.dup
    a.delete_at el_index
    a.reduce(:*)
  end
end
