# Write an algorithm that takes an integer and prints all pythagorean triples
# with side lengths up to that integer

# Using the formula which states that for integers m,n where m > n,
# the Pythagorean triple is 2mn, (m**2 - n**2), (m**2 + n**2)

def find_triples(num)
  triples = []
  (1..num).each do |n|
    (2..num).each do |m|
      a = 2*m*n
      b = m**2 - n**2
      c = m**2 + n**2
      triple = [a, b, c].sort
      if triple.any? {|x| x == 0 } or triple.any? {|x| x > num }
        next
      else
        triples.push triple
      end
    end
  end
  triples
end

context 'tests the thing' do

  it 'returns all triples under 6' do
    expect(find_triples(6)).to eq [[3,4,5]]
  end

  it 'returns all triples under 10' do
    expect(find_triples(10)).to eq [[3,4,5], [6, 8, 10]]
  end

end