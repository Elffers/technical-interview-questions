# first pass
def complement(array, sum)
  operands = array.select {|num| num <= sum}
  complements = []
  operands.each do |operand|
    complement = sum - operand
    if array.include? complement
      complements << complement
    end
  end
  operands.zip(complements)
end

#refactor

def complement2(array, sum)
  operands = array.select {|num| num <= sum}
  complements = operands.map do |operand|
    complement = sum - operand
    [operand, complement] if array.include? complement
  end
  complements
end

# using hash

def complements(array, sum)
  elements = Set.new(array)
  complements = {}
  array.each do |num|
    complement = sum - num
    complements[num] = complement if elements.include?(complement)
  end
  complements
end

# as a class method

class Array
  require 'set'
  def complements(sum)
    elements = Set.new(self)
    complements = {}
    self.each do |num|
      complement = sum - num
      complements[num] = complement if elements.include?(complement)
    end
    complements
  end
end
