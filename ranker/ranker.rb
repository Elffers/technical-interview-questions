#!/usr/bin/env ruby
# things that make a script executable are the executable bit set and a
# shebang specification. I.e., chmod +x filename.rb

class Ranker
  attr_reader :games, :rankings

  # sanitizes input file, instantiates rankings hash
  def initialize input
    @games = input.map { |line| line.delete("\n") }
    @rankings = Hash.new 0
  end

  # parses each line of input file, captures data and stores them to variables
  # Ex: For a line in input "1)  Seattle: 28, Patriots: 30" would return an
  # array ["Seattle", 28, "Patriots, 30"]
  def parse
    @games = @games.map do |game|
      /^\d+\) (?<team_1>.*?): (?<score_1>\d+), (?<team_2>.*?):\s(?<score_2>\d+)/ =~ game
      [team_1, score_1.to_i, team_2, score_2.to_i]
    end
  end

  # Attribute points to each team: 3 for a win, 1 for tie, 0 for loss
  # Sets those scores in @rankings hash
  def score
    parse
    @games.each do |team_1, score_1, team_2, score_2|
      if score_1 > score_2
        @rankings[team_1] += 3
      elsif score_1 < score_2
        @rankings[team_2] += 3
      else
        @rankings[team_1] += 1
        @rankings[team_2] += 1
      end
    end
  end

  def rank
    score
    raw = @rankings.keys.group_by { |team| @rankings[team] }
    raw.sort_by { |rank, games| rank }
  end

  def output
    rankings = rank
    output = []
    rankings.reverse_each.with_index do |(rank, teams), i|
      teams.sort.each do |team|
        output.push "#{i+1}) #{team}"
      end
    end
    output
  end
end

# $0 is the name of the executable (program name). If it is the same as the
# filename, then it will run as an executable. If not, it's a library.

if $0 == __FILE__
  games = ARGF.each_line
  ranker = Ranker.new games
  puts ranker.output
end
