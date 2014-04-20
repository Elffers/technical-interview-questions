require_relative 'binary_search'

describe BinarySearch do
  let(:array){ [1, 2, 2, 3, 3, 4, 5, 6] }
  context 'the element is not contained in the array' do
    it 'returns nil' do
      bs = BinarySearch.new(array)
      expect(bs.binary_search(0)).to eq nil
    end
  end
  context 'the needle is the same as the value of the pivot' do
    it 'the element is the same as the initial pivot' do
      bs = BinarySearch.new(array)
      expect(bs.binary_search(3)).to eq 3
    end
  end
  context 'the needle is less than the value of the pivot' do
    it 'the element is the same as the initial pivot' do
      bs = BinarySearch.new(array)
      expect(bs.binary_search(2)).to eq 1
    end
  end
  context 'the needle is greater than the value of the pivot' do
    it 'the element is the same as the initial pivot' do
      bs = BinarySearch.new(array)
      expect(bs.binary_search(6)).to eq 7
    end
  end

end