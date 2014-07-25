# Implementation of a Reverse Polish Notation calculator using stack data
# structure

class RPNCalc
  OPERATORS = %w[+ - * /]
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def input(element)
    element = evaluate(element) if OPERATORS.include?(element)
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
    result = nil
    # sets the first operand to be the older element in the stack for
    # readability of binary operations
    operand2 = pop
    operand1 = pop
    case operator
    when "+", "*"
      result = [operand1, operand2].reduce(operator.to_sym)
    when "-"
      result = operand1 - operand2
    when "/"
      result = operand1.to_f / operand2.to_f
    end
    result
  end
end
