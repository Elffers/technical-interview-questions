require_relative 'word_golf'

context 'one_away' do
  it 'returns true if words differ by one letter' do
    expect(one_away("park", "bark")).to eq true
    expect(one_away("park", "part")).to eq true
  end

  it 'returns false if words differ by more than one letter' do
    expect(one_away("park", "tart")).to eq false
  end

  it 'returns false if no letters differ' do
    expect(one_away("park", "park")).to eq false
  end
end
context 'transform' do
  it 'returns the target word' do
    expect(transform("park", "dart")).to eq ["part", "dart"]
  end

end

