require_relative 'max_sum'

context 'dynamic' do
  it 'returns max sum' do
    a = [6, 4, 5, 7, 1]
    b = [1, 5, 2]
    c = [6, 1, 5, 7, 0, 16, 12, 3, 2, 8, 123, 7, 2, 3, 39, 5, 22, 6, 1, 6, 8, 345, 2, 3, 16, 9, 123, 1, 1, 5, 8, 2]
    expect(max_subset a).to eq 13
    expect(max_subset b).to eq 5
    expect(max_subset c).to eq 717
  end
end
context 'recursive' do
  it 'returns max sum' do
    a = [6, 4, 5, 7, 1]
    b = [1, 5, 2]
    c = [6, 1, 5, 7, 0, 16, 12, 3, 2, 8, 123, 7, 2, 3, 39, 5, 22, 6, 1, 6, 8, 345, 2, 3, 16, 9, 123, 1, 1, 5, 8, 2]
    expect(brute_force a).to eq 13
    expect(brute_force b).to eq 5
    expect(brute_force c).to eq 717 
  end
end

