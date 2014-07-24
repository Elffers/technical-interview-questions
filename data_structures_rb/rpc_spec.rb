require_relative "rev_polish_calc"

describe RPNCalc do
  let(:calc) { RPNCalc.new }

  context '#push' do
    it 'adds an element to the stack' do
      calc.push(1)
      expect(calc.stack.first).to eq 1
    end
  end

  context '#pop' do
    it 'removes last element' do
      calc.push(1)
      calc.push(2)
      expect(calc.pop).to eq 2
    end
  end

end
