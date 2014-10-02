# Given an array of numbers and an integer, return all pairs contained in the array whose sum equals that integer
# (Zillow mock interview question)

# O(n**2) time: iterate through array, then iterate again per element
# (.include?)
# O(2n) space

def complement_1(array, sum)
  complements = []
    array.each do |operand|
    complement = sum - operand
    complements.push [operand, complement] if array.include? complement
  end
  complements
end

# using hash
# O(n) for iteration, .include on Set is constant lookup
# O(2n) space

def complement_2(array, sum)
  elements = Set.new(array)
  complements = {}
  array.each do |num|
    complement = sum - num
    complements[num] = complement if elements.include?(complement)
  end
  complements
end

# O(2n) + runtime of &
# O(3n) space
def complement_3 array, sum
  complements = array.map {|x| sum - x }
  intersection = array & complements
  intersection.map {|num| [num, sum - num ] }
end

context 'complement 1' do
  let(:array){[9, 2, 3, 1, 4, 7, 5, 8, 6]}
  it 'works' do
    expect(complement_1(array, 8).sort_by{|x| x.first}).to eq [[1, 7], [2, 6], [3, 5], [4, 4], [5, 3], [6, 2], [7, 1]]
  end
end

context 'complement 2' do
  let(:array){[9, 2, 3, 1, 4, 7, 5, 8, 6]}
  it 'works' do
    expect(complement_2(array, 8)).to eq( {2=>6, 3=>5, 1=>7, 4=>4, 7=>1, 5=>3, 6=>2} )
  end
end

context 'complement 3' do
  let(:array){[9, 2, 3, 1, 4, 7, 5, 8, 6]}
  it 'works' do
    array = [1, 2, 3, 5]
    expect(complement_3(array, 7)).to eq [[2, 5], [5, 2]]
  end
  it 'works' do
    expect(complement_3(array, 8).sort_by{|x| x.first}).to eq [[1, 7], [2, 6], [3, 5], [4, 4], [5, 3], [6, 2], [7, 1]]
  end
end
