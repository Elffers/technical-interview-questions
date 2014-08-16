# Find the first non-repeated character in a string

def repeater(string)
  store = {}
  string.chars.each_with_index do |letter, i|
    if store.key? letter
      store[letter][0] += 1
    else
      store[letter] = [1, i]
    end
  end
  sorted = store.sort_by do |k, v|
    v.last
  end
  sorted.each do |pair|
    return pair.first if pair.last.first == 1
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