# Find the first non-repeated character in a string

def repeater(string)
  store = Hash.new(0)
  string.each_char do |letter|
    store[letter] += 1
  end
  store.each do |k, v|
    return k if v == 1
  end
  nil
end

context 'repeater tests' do
  it 'works for 1 repeated character' do
    string = "abcda"
    expect(repeater(string)).to eq "b"
  end

  it 'works for single character string' do
    expect(repeater "a").to eq "a"
  end

  it 'returns nil for two-char repeated string' do
    expect(repeater "aa").to eq nil
  end

  it 'returns nil for another thing' do
    expect(repeater "aabb").to eq nil
  end

  it 'returns nil for another thing' do
    expect(repeater "aabcb").to eq "c"
  end

end