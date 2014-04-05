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
    count = array.count(element)
    if count == 1
      return element
    end
  end
end

def match(match, array)
  result = false
  for el in array
    if el == match
      result = true
    end
  end
  result
end
