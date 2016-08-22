require_relative 'two_array_sum'

describe 'balance' do
  it 'returns two arrays' do
    array = [1, 2, 3]
    expect(balance array).to eq [[3], [2, 1]]
  end

  it 'returns two arrays' do
    array = [1, 2, 4]
    expect(balance array).to eq [[4], [2, 1]]
  end

  it 'returns two arrays' do
    array = [5, 5, 5]
    expect(balance array).to eq [[5], [5, 5]]
  end

  it 'returns two arrays' do
    array = [1, 2, 3, 5, 6, 10]
    expect(balance array).to eq [[10, 3], [6, 5, 2, 1]]
  end

  it 'returns two arrays' do
    array = [1, 2, 4, 5, 6, 7, 8]
    expect(balance array).to eq [[8, 5, 2, 1], [7, 6, 4]]
  end

  it 'returns two arrays' do
    array = [1, 2, 4, 5, 6, 7, 100]
    expect(balance array).to eq [[100], [7, 6, 5, 4, 2, 1]]
  end

  it 'returns two arrays' do
    array = [1, 2, 4, 15, 17, 20]
    expect(balance array).to eq [[20, 4, 2, 1], [17, 15]]
  end

end
