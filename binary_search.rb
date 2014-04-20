class BinarySearch

  def initialize(array)
    @array = array
  end

  def binary_search(needle, pivot=@array.length/2)
    unless pivot == 0
      if @array[pivot] == needle
        return pivot
      elsif @array[pivot] > needle
        pivot = pivot/2
        binary_search(needle, pivot)
      else
        pivot = pivot + pivot/2
        binary_search(needle, pivot)
      end
    end
  end
end