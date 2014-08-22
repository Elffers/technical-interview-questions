# Reverse the word order of a string and then reverse then letters in each word.

class TeamElizabetHString

  def initialize(string)
    @string = String.new(string)
  end

  def reverse_order
    rev_order = []
    str_array = @string.split
    last_index = str_array.length - 1
    len = str_array.length
    len.times do
      rev_order << str_array[last_index]
      last_index -= 1
    end
    rev_order.join(' ')
  end
end

def reverse_letters(word)
  word.chars.reverse.join
end

describe 'word order' do
  let(:string1){ TeamElizabetHString.new("hello world") }
  it 'reverses a two word string' do
    expect(string1.reverse_order).to eq "world hello"
  end

  it 'reverses letters in a word' do
    expect(reverse_letters('pancakes')).to eq "sekacnap"
  end
end
