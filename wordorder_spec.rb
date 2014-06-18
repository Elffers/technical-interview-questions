require_relative 'wordorder'

describe 'word order' do
  let(:string1){ TeamElizabetHString.new("hello world") }
  it 'reverses a two word string' do
    expect(string1.reverse_order).to eq "world hello"
  end

  it 'reverses letters in a word' do
    expect(reverse_letters('pancakes')).to eq "sekacnap"
  end
end