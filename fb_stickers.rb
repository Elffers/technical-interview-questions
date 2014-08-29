require 'Benchmark'
# Facebook logo stickers cost2 each from the company store.
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
  'f' => 1,
  'a' => 1,
  'c' => 1,
  'e' => 1,
  'b' => 1,
  'o' => 2,
  'k' => 1
}

# Solution 1:
# Start with one sticker
# Iterate through characters in string (stripped of white space)
# Decrement count for each letter. If count reaches 0, add a sticker.
# Time complexity: O(n+ m), where O(m) is needed for adding a sticker.
# Space complexity: In place (plus space for sticker hash table, so O(n+m)

def foo(string)
  string = string.delete(' ')
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

# Solution 2:
# Count all the letters
# Divide by sticker count
# Find max
# O(3n) : count_letters is O(n), .map is O(n), .max is O(n)
# Space complexity: O(n + m), where m is space for STICKERS

def bar(string)
  string = string.delete(' ')
  counts = count_letters(string)
  string.chars.map do |letter|
    counts[letter] / STICKER[letter]
  end.max
end

def count_letters(string)
  counts = Hash.new(0)
  string.chars.each do |letter|
    counts[letter] += 1
  end
  counts
end

Benchmark.bm do |x|
  x.report { 20000.times do ; foo("coffee kebab") ;end }
  x.report { 20000.times do ; foo("ffacebook") ;end }
  x.report { 20000.times do ; foo("book") ;end }


  x.report { 20000.times do ; bar("coffee kebab") ;end }
  x.report { 20000.times do ; bar("ffacebook") ;end }
  x.report { 20000.times do ; bar("book") ;end }
end
