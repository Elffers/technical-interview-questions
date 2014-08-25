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

f = File.open("fours.txt", "r").readlines
VALID_WORDS = f.map {|word| word.chop}

p VALID_WORDS
def word_index
  output = {}
  VALID_WORDS.each do |word|
    output[word] = []
    VALID_WORDS.each do |target|
      output[word].push(target) if one_away(word, target)
    end
  end
  output
end


# compares each letter of each word against the other and makes sure there is
# only one mismatch

def one_away(word, target)
  zipped = word.chars.zip(target.chars)
  bools= zipped.map do |pair|
    pair.first == pair.last
  end
  bools.count(false) == 1
end
p word_index
