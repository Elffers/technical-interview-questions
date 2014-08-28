# Given a string "hello people, or Mordor!"
# Reverse the word sequence as follows: "Mordor! or, people hello"

class HString(object):
    def __init__(self, string):
        self.contents = string

    def hreverse(self):
        words = self.contents.split()
        words.reverse()
        return (' ').join(words)

