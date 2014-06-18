require_relative 'wordorder'

describe 'word order' do
  let(:string1){ "hello world" }
  it 'reverses a two word string' do
    expect(reverse_order(string1)).to eq "world hello"
  end

end