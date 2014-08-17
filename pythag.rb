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
      if triple.any? {|x| x <= 0 } or triple.any? {|x| x > num }
        next
      else
        triples.push triple
        # need to take into account non-primitive triples
        factor = 2
        p "primitive", triple
        while triple.last * factor <= num
          non_prim = triple.map { |t| factor * t }
          triples.push non_prim
          factor += 1
        end
      end
    end
  end
  triples.uniq
end

context 'tests the thing' do

  it 'returns all triples under 6' do
    expect(find_triples(6)).to eq [[3,4,5]]
  end

  it 'returns all triples under 10' do
    expect(find_triples(10)).to eq [[3,4,5], [6, 8, 10]]
  end

  it 'returns all triples under 25' do
    output = find_triples(25).sort_by {|set| set.last }
    expect(output).to eq [[3,4,5], [6, 8, 10], [5, 12, 13], [9, 12, 15], [8, 15, 17], [12, 16, 20], [15,20,25], [7,24, 25]]
  end

end