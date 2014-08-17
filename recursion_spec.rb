require_relative 'recursion'

context 'sum' do
  it 'sums 1 element' do
    expect(sum([1])).to eq 1
  end

  it 'sums 2 elements' do
    expect(sum([1,2])).to eq 3
  end

  it 'sums 5 elements' do
    expect(sum([1,2,3,4,5])).to eq 15
  end
end

context 'reverse' do
  it 'reverses 1 char string' do
    expect(reverse("a")).to eq "a"
  end
  it 'reverses 2 char string' do
    expect(reverse("ba")).to eq "ab"
  end
  it 'reverses 5 char string' do
    expect(reverse("hello")).to eq "olleh"
  end
end
