# Write an algorithm that takes an integer and prints all pythagorean triples
# with side lengths up to that integer

# Using the formula which states that for integers m,n where m > n,
# the Pythagorean triple is 2mn, (m**2 - n**2), (m**2 + n**2)

def find_triples(num)

end

def addends(num)
  pairs = []
  (1..num/2).each do |x|
    pair = [x, num - x]
    pairs.push pair
  end
  pairs
end


context 'tests the thing' do

  it 'returns all addends for a number' do
    expect(addends(6)).to eq [[1,5], [2,4], [3, 3]]
  end

  xit 'returns all triples under 6' do
    expect(find_triples(6)).to eq [[3,4,5]]
  end

end