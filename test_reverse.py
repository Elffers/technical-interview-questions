import unittest
from reverse import HString

class TestReverse(unittest.TestCase):
    def setUp(self):
        self.hstring = HString("hello people, or Mordor!")

    def test_reverse(self):
        actual = self.hstring.hreverse() 
        expected = "Mordor! or people, hello"
        self.assertEqual(actual, expected)
