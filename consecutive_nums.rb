# Instructure interview question
# Given an unsorted list of numbers 0 - n that is missing one element, how
# would you find which number is missing?

# Solution 1:
# Sort the list, then iterate through and compare against the index
# .sort is O(nlog(n)) complexity
# .each is O(n) complexity
# operation is done in place, i.e. O(n) space

def finder(array)
  sorted = array.sort
  sorted.each_with_index do |num, i|
    return i if num != i
  end
  # if missing element == n
  sorted.length
end

# Solution 2:
# Map elements to a new sorted array
# Compare element to the index in new array
# O(n) extra space, for new array (sorted)
# O(2n) time, once to iterate through array, once to find nil element

def finder2(array)
  sorted = Array.new()
  array.each do |num|
    sorted[num] = num
  end
  missing = sorted.index(nil)
  unless missing
    missing = array.length
  end
  missing
end

context 'finder' do
  it 'returns missing element' do
    array = [4, 0, 2, 3]
    expect(finder array).to eq 1
  end

  it 'returns 0 if first element is missing' do
    array = [1,2]
    expect(finder array).to eq 0
  end

  it 'returns largest element if last one is missing' do
    array = [0,1]
    expect(finder array).to eq 2
  end
end

context 'finder2' do
  it '2nd method returns missing element' do
    array = [4, 0, 1, 3]
    expect(finder2 array).to eq 2
  end

  it 'returns 0 if first element is missing' do
    array = [1,2]
    expect(finder2 array).to eq 0
  end

  it 'returns last element if last element is missing'  do
    array = [1, 0, 2,]
    expect(finder2 array).to eq 3
  end
end
