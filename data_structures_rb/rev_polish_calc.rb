class RPNCalc
  OPERATORS = %w[+ - * /]
  attr_accessor :stack

  def initialize 
    @stack = []
  end

  def input(element)
    if OPERATORS.include? element 
      element = evaluate(element)
    end
    @stack.push(element)
    element
  end

  def pop
    if @stack.empty?
      raise IndexError
    else 
      @stack.pop
    end
  end

  def evaluate(operator)
    value = nil
    operand2 = pop
    operand1 = pop
    case operator
      when "+","*"
        value = [operand1,operand2].reduce(operator.to_sym)
      when "-"
        value = operand1 - operand2
      when "/"
        value = operand1.to_f/operand2.to_f
    end
    value
  end
end
