require_relative 'max_sum'

context 'recursive' do
  it 'returns max sum' do
    a = [6, 4, 5, 7, 1]
    b = [1, 5, 2]
    expect(max_subset a).to eq 13
    expect(max_subset b).to eq 5
  end
end
