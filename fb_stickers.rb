# Facebook logo stickers cost $2 each from the company store.
# I have an idea. I want to cut up the stickers, and use the
# letters to make other words/phrases. A Facebook logo sticker
# contains only the word 'facebook', in all lower-case letters.
#
# Write a function that, given a string consisting of a word or
# words made up of letters from the word 'facebook', outputs an
# integer with the number of stickers I will need to buy.
#
# foo('coffee kebab') -> 3
# foo('book') -> 1
# foo('ffacebook') -> 2
#
# You can assume the input you are passed is valid, that is,
# does not contain any non-'facebook' letters, and the only
# potential non-letter characters in the string are spaces.

STICKER = {
  "f" => 1,
  "a" => 1,
  "c" => 1,
  "e" => 1,
  "b" => 1,
  "o" => 2,
  "k" => 1
}

def foo(string)
  string = string.delete(" ")
  counts = STICKER.dup
  stickers = 1
  string.chars.each do |letter|
    if counts[letter] == 0
      add_sticker(counts)
      stickers += 1
    else
      counts[letter] -= 1
    end
  end
  stickers

end

def add_sticker(counts)
  STICKER.each do |letter, count|
    counts[letter] += count 
  end
  counts
end
