def first_uniq_with_hash(array)
  hash = Hash.new(0)
  array.each do |element|
    hash[element] += 1
  end
  array.find { |el| hash[el] == 1 }
end

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
