module HEnumerable

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

  def each_cons(slice, &block)
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

