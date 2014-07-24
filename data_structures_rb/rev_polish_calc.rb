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
    value = nil
    el = @stack[-1]
    i = @stack.index(el)
    operand2 = @stack[i-1]
    operand1 = @stack[i-2]
    case el
      when "+","*"
        value = [operand1,operand2].reduce(el.to_sym)
      when "-"
        value = operand1 - operand2
      when "/"
        value = operand1.to_f/operand2.to_f
    end
    @stack = []
    value
  end
end
