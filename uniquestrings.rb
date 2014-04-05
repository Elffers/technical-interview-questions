def first_uniq_with_hash(array)
  hash = Hash.new(0)
  array.each do |element|
    hash[element] += 1
  end
  array.find { |el| hash[el] == 1 }
end

def first_uniq_match(array)
  array.each_with_index do |element, index|
    match = element
    slice = array[index+1..-1]
    puts "match=#{match}", "slice=#{slice}", match(match, slice)

    if not match(match, slice)
      return match
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
