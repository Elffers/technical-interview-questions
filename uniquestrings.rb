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
    return element if array.count(element) == 1
  end
  nil
end

require_relative "data_structures_rb/binary_search"
def first_uniq(array)
  sorted = array.sort
  bs = BinarySearch.new(sorted)
  array.each do |el|
    index = bs.binary_search(el)
    if el != bs.array[index - 1] && el!= bs.array[index + 1]
      return el
    end
  end
  nil
end


context 'first_uniq_with_hash' do
  let(:list){ %w[a b c a d d] }
  it 'works' do
    expect(first_uniq_with_hash list).to eq "b"
    expect(first_uniq_with_hash %w[a b]).to eq "a"
  end

  it 'returns nil if no unique' do
    expect(first_uniq_with_hash %w[a a b b]).to eq nil
  end
end

context 'first_uniq_match' do
  let(:list){ %w[a b c a d d] }
  it 'works' do
    expect(first_uniq_match list).to eq "b"
    expect(first_uniq_match %w[a b]).to eq "a"
  end

  it 'returns nil if no unique' do
    expect(first_uniq_match %w[a a b b]).to eq nil
  end
end

context 'first_uniq' do
  let(:list){ %w[a b c a d d] }
  it 'works' do
    expect(first_uniq list).to eq "b"
    expect(first_uniq %w[a b]).to eq "a"
  end

  it 'returns nil if no unique' do
    expect(first_uniq %w[a a b b]).to eq nil
  end
end
