require_relative "rev_polish_calc"

describe RPNCalc do
  let(:calc) { RPNCalc.new }

  context '#input' do
    it 'adds an element to the stack' do
      calc.input(1)
      expect(calc.stack.first).to eq 1
    end
  end

  context '#pop' do
    it 'removes last element' do
      calc.input(1)
      calc.input(2)
      expect(calc.pop).to eq 2
    end

    it 'raises error if pop an empty stack' do
      expect{ calc.pop }.to raise_error
    end
  end

  context '#evaluate' do
    it 'evaluates addition of 2 numbers' do
      calc.input(1)
      calc.input(2)
      expect(calc.input("+")).to eq 3
    end

    it 'evaluates subtraction' do
      calc.input(5)
      calc.input(3)
      expect(calc.input("-")).to eq 2
    end

    it 'evaluaes multiplication' do
      calc.input(5)
      calc.input(3)
      expect(calc.input("*")).to eq 15
    end

    it 'evaluates integer division' do
      calc.input(6)
      calc.input(3)
      expect(calc.input("/")).to eq 2
    end

    it 'evaluates integer division' do
      calc.input(5)
      calc.input(2)
      expect(calc.input("/")).to eq 2.5
    end

    it 'evalutates multiple operations with PEMDAS' do
      calc.input(5)
      calc.input(3)
      p calc.input("-")
      p calc.stack.inspect
      calc.input(5)
      calc.input(3)
      p calc.stack
      p calc.input("+")
      p calc.stack
      expect(calc.input("*")).to eq 16
    end
    it 'evaluates PEMDAS' do
      calc.input(3)
      calc.input(5)
      calc.input(4)
      calc.input("*")
      expect(calc.input("+")).to eq 23
    end

    it 'evaluates PEMDAS 2' do
      calc.input(3)
      calc.input(5)
      calc.input(4)
      calc.input("+")
      expect(calc.input("*")).to eq 27
    end
  end

end
