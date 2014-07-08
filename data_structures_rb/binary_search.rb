class BinarySearch
  attr_accessor :array

  def initialize(array)
    @array = array
  end

# TODO: write it not recursively and benchmark

  def binary_search(needle, low=0, high=@array.length - 1)
    if low == high
      return high if needle == @array[high]
      return
    end
    middle = (high - low)/2 + low
    if @array[middle] == needle
      return middle
    elsif @array[middle] > needle
      high = middle
      binary_search(needle, low, high)
    else
      low = middle + 1
      binary_search(needle, low, high)
    end
  end
end