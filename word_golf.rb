#  Given a four letter word, such as "golf", figure out how many moves it
#  would take to transform that word in another word, (e.g. "park"), making
#  sure that every transformation results in another valid word.
#  A move counts as movin a single letter into another one.

require 'open-uri'

# list = "http://www-01.sil.org/linguistics/wordlists/english/wordlist/wordsEn.txt"
# word_list = open(list)
# words = word_list.map {|word| word.chop }

# VALID_WORDS = words.select { |x| x if x.length == 4 }
# somehow index the words for faster lookup

def word_index
  output = {}
  VALID_WORDS.each do |word|
    output[word] = []
  end
end

def one_away(word, target)

end

def transform(word)
end

context 'one_away' do
  it 'returns true if words differ by one letter' do
    expect(one_away("park", "bark")).to eq true
  end

  it 'returns false if words differ by more than one letter' do
    expect(one_away("park", "tart")).to eq false
  end

  it 'returns false if no letters differ' do
    expect(one_away("park", "park")).to eq false

  end
end

