# Code challenge for formidable labs

###
# Top-down approach - recursive solution

def recursive_min_sum(head)
  current = head
  current.sum = current.value.to_i
  current.path = [current.value]

  unless current.left && current.right
    current.sum = current.value.to_i
    current.path = [current.value]
    current
  else
    left_child = recursive_min_sum(current.left)
    right_child = recursive_min_sum(current.right)
    min_child = left_child.sum < right_child.sum ? left_child : right_child
    current.sum += min_child.sum
    current.path += min_child.path
    current
  end
end

def map_to_node(row, column, pyramid)
  if row == (pyramid.length - 1)
    BinaryTree::Node.new(nil, nil, pyramid[row][column])
  else
    left = map_to_node(row + 1, column, pyramid)
    right = map_to_node(row + 1, column + 1, pyramid)
    BinaryTree::Node.new(left, right, pyramid[row][column])
  end
end

class BinaryTree
  attr_reader :head
  def initialize(head)
    @head = head
  end

  class Node
    attr_accessor :left, :right, :value, :sum, :path
    def initialize(left, right, value)
      @left = left
      @right = right
      @value = value
    end
  end
end

###
# Bottom-up solution - Dynamic Programming solution

def dp_min_sum(pyramid)
  last_row = pyramid.pop
  # memoize last row
  results = last_row.map { |el| Node.new(el.to_i, [el]) }

  while pyramid.length > 0
    last_row = pyramid.pop

    results = last_row.map.with_index do |el, i|
      left_child = results[i]
      right_child = results[i+1]
      min_child = left_child.sum < right_child.sum ? left_child : right_child
      sum = el.to_i + min_child.sum
      path = [el] + min_child.path
      Node.new(sum, path)
    end
  end
  return results.first.sum, results.first.path
end

class Node
  attr_accessor :sum, :path
  def initialize sum, path
    @sum = sum.to_i
    @path = path
  end
end

describe "dp_min_sum" do
  it "returns the min sum and path" do
  pyramid = [
       ["07"],
     ["51", "29"],
   ["13", "11",  "70"],
 ["30", "31", "77", "45"]
]
  expect(dp_min_sum(pyramid)).to eq [78, ["07", "29", "11", "31"]]
  end
end

describe "map_to_node" do
  it "maps a pyramid-shaped array to the head node of a tree" do
    pyramid = [
      ["07"],
      ["51", "29"],
      ["13", "11",  "70"],
      ["30", "31", "77", "45"]
    ]
    expect(map_to_node(0, 0, pyramid).value).to eq "07"
  end
end

describe "recursive_min_sum" do
  it "returns the min sum and path" do
    pyramid = [
      ["07"],
      ["51", "29"],
      ["13", "11",  "70"],
      ["30", "31", "77", "45"]
    ]
  head = map_to_node(0, 0, pyramid)
  expect(recursive_min_sum(head).sum).to eq 78
  expect(recursive_min_sum(head).path).to eq ["07", "29", "11", "31"]
  end
end
