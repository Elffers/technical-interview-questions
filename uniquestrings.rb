# Given a list of strings, how would you find the first unique string?
# (Assume there is high repetition within the list)

# Approach 1: Use hash table to store frequency of each element.
# O(n) time
# O(n) space
def first_uniq_with_hash(array)
  hash = Hash.new(0)
  array.each do |element|
    hash[element] += 1
  end
  array.find { |el| hash[el] == 1 }
end

# Approach 2: For each element, find if there is a match in the rest of the array
# O(n**2) time
# O(1) space

def first_uniq_match(array)
  array.each do |element|
    if array.count(element) == 1
      return element
    end
  end
end

def first_uniq(array)
  sorted = array.sort
  bs = BinarySearch.new(sorted)
  array.each do |el|
    index = bs.binary_search(el)
p bs.array[index - 1, 3]
    if el != bs.array[index - 1] && el!= bs.array[index + 1]
      return el
    end
  end
end



