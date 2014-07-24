class RPNCalc
  attr_accessor :stack

  def initialize 
    @stack = []
  end

  def input(element)
    @stack.push(element)
  end

  def pop
    if @stack.empty?
      raise IndexError
    else 
      @stack.pop
    end
  end

  def evaluate
    el = @stack[-1]
    i = @stack.index(el)
    operand2 = @stack[i-1]
    operand1 = @stack[i-2]
    case el
      when "+","*"
        [operand1,operand2].reduce(el.to_sym)
      when "-"
        operand1 - operand2
      when "/"
        operand1.to_f/operand2.to_f
    end
  end
end
