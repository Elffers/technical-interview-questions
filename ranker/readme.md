The Problem
===========
Create a command-line application that will calculate the
ranking table for a football league.

Input/output
------------
The input and output will be text. Your solution should parse an input
file (ranker_test_input.txt)  via stdin (pipe or redirect) or by parsing a file passed
by name on the command line. Your solution should output the correct result via
stdout to the console.

The input contains results of games, one per line. See sample-input.txt for
details. The output should be ordered from most to least points, following the
format specified in ranker_test_output.txt.

You can expect that the input will be well-formed. There is no need to add
special handling for malformed input files.

The rules
---------
In this league, a draw (tie) is worth 1 point and a win is worth 3 points. A
loss is worth 0 points. If two or more teams have the same number of points,
they should have the same rank and be printed in alphabetical order (as in the
tie for 3rd place in the sample data)
