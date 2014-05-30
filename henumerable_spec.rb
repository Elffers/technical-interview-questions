require_relative 'henumerable'

class HEnumerator
  include HEnumerable

  def each
    yield 1
    yield 2
    return -5
  end

end
describe 'HEnumerable' do
  let(:henumerator) { HEnumerator.new }

  context '#all?' do
    it 'returns true if all elements match block' do
      expect(henumerator.all? { |x| true }).to eq true
    end

    it 'returns false if at least one element does not match block' do
      expect(henumerator.all? { |x| x % 2 == 0 }).to eq false
    end
  end

  context '#map' do
    it "maps element to whatever the block yields" do
      expect(henumerator.map { |x| x * 2 }).to eq [2, 4]
    end
  end

  context '#select' do
    it 'returns elements matching the block' do
      expect(henumerator.select { |x| x % 2 == 0 }).to eq [2]
    end
  end

end


# class SortedList
#   include FakeEnumerable

#   def initialize
#     @data = []
#   end

#   def <<(new_element)
#     @data << new_element
#     @data.sort!

#     self
#   end

#   def each
#     if block_given?
#       @data.each { |e| yield(e) }
#     else
#       FakeEnumerator.new(self, :each)
#     end
#   end
# end

# require "minitest/autorun"

# describe "FakeEnumerable" do
#   before do
#     @list = SortedList.new

#     # will get stored interally as 3,4,7,13,42
#     @list << 3 << 13 << 42 << 4 << 7
#   end

#   it "supports map" do
#     @list.map { |x| x + 1 }.must_equal([4,5,8,14,43])
#   end

#   it "supports sort_by" do
#     # ascii sort order
#     @list.sort_by { |x| x.to_s }.must_equal([13, 3, 4, 42, 7])
#   end

#   it "supports select" do
#     @list.select { |x| x.even? }.must_equal([4,42])
#   end

#   it "supports reduce" do
#     @list.reduce(:+).must_equal(69)
#     @list.reduce { |s,e| s + e }.must_equal(69)
#     @list.reduce(-10) { |s,e| s + e }.must_equal(59)
#   end
# end

# describe "FakeEnumerator" do
#   before do
#     @list = SortedList.new

#     @list << 3 << 13 << 42 << 4 << 7
#   end

#   it "supports next" do
#     enum = @list.each

#     enum.next.must_equal(3)
#     enum.next.must_equal(4)
#     enum.next.must_equal(7)
#     enum.next.must_equal(13)
#     enum.next.must_equal(42)

#     assert_raises(StopIteration) { enum.next }
#   end

#   it "supports rewind" do
#     enum = @list.each

#     4.times { enum.next }
#     enum.rewind

#     2.times { enum.next }
#     enum.next.must_equal(7)
#   end

#   it "supports with_index" do
#     enum     = @list.map
#     expected = ["0. 3", "1. 4", "2. 7", "3. 13", "4. 42"]

#     enum.with_index { |e,i| "#{i}. #{e}" }.must_equal(expected)
#   end
# end