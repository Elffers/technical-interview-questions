module HEnumerable

  NOTHING = Object.new

  def all?
    each do |el|
      return false unless yield(el)
    end
    true
  end

  def any?
    each do |el|
      return true if yield el
    end
    false
  end

  def count(target=NOTHING)
    count = 0
    each do |el|
      if block_given?
        count += 1 if yield(el)
      elsif NOTHING != target
        count += 1 if el == target
      else
        count += 1
      end
    end
    count
  end

  def each_cons(slice)
    array = []
    each do |el|
      array.push el
      if array.size < slice
        next
      elsif array.size > slice
        array.shift
      end
      # since we are yielding a copy of the array at the current state, it doens't matter that
      # the array is being changed each time
      yield array.dup
    end
    nil
  end

  def map
    output = []
    each do |el|
      output.push yield el
    end
    # without explicitly returning output, the way each is defined in the spec file
    # returns the last yielded element. This means when push is called, it will return
    # the last line of map for the last yielded element in #each. Without explicitly
    # returning output at the end of the method, the return value could change
    # depending on how #each is defined in the enumerator class.
    output
  end

  alias_method :collect, :map

  def none?(&block)
    !any?(&block)
  end

  def select
    output = []
    each do |el|
      output.push el if yield el
    end
    output
  end

  def sort_by
  end

  def reduce()
  end

end

