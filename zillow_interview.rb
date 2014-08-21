# Given an array of numbers and an integer, return all pairs contained in the array whose sum equals that integer

def complement_1(array, sum)
  complements = []
    array.each do |operand|
    complement = sum - operand
    complements.push [operand, complement] if array.include? complement
  end
  complements
end

# using hash

def complement_2(array, sum)
  elements = Set.new(array)
  complements = {}
  array.each do |num|
    complement = sum - num
    complements[num] = complement if elements.include?(complement)
  end
  complements
end

context 'complement 1' do
  let(:array){[9, 2, 3, 1, 4, 7, 5, 8, 6]}
  it 'works' do
    expect(complement_1(array, 8).sort_by{|x| x.first}).to eq  [[1,7], [2,6], [3, 5]]
  end
end

context 'complement 2' do
  let(:array){[9, 2, 3, 1, 4, 7, 5, 8, 6]}
  it 'works' do
    expect(complement_2(array, 8).sort_by{|x| x.first}).to eq  [[1,7], [2,6], [3, 5]]
  end
end
