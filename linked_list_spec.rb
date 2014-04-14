require_relative 'linkedlist'
require 'rspec'

describe LinkedList do
  let(:list) { LinkedList.new(5, nil) }
  xit 'inserts a new node in an empty list' do

  end

  it 'inserts a node after a smaller node' do
    list.insert(4)
    expect(list.to_a).to eq [5, 4]
  end

  it 'inserts a node before a larger node' do
    list.insert(6)
    expect(list.to_a).to eq [6, 5]
  end

  it 'inserts a node between two nodes' do
    list.insert(3)
    list.insert(4)
    expect(list.to_a).to eq [5, 4, 3]
  end

end