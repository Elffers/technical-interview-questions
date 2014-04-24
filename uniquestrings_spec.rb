require_relative 'uniquestrings'
require_relative 'binary_search'

describe 'uniquestring' do

  let(:array1){ [3, 1, 2, 3, 1, 1, 4, 4] }
  let(:array2){ [3, 1, 2, 4, 3, 4, 2, 5, 1, 1, 3] }
  let(:array3){ [1, 2, 2] }
  let(:array4){ [1, 1, 2] }

  it 'should return 2 as the first unique element' do
    expect(first_uniq(array1)).to eq 2
  end
  it 'should return 4 as the first unique element' do
    expect(first_uniq(array2)).to eq 5
  end
  it 'should return 1 as the first unique element' do
    expect(first_uniq(array3)).to eq 1
  end
  it 'should return 2 as the first unique element' do
    expect(first_uniq(array4)).to eq 2
  end
end