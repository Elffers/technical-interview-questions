# 9/1/14 (7 minutes)
#line parser, returns winner and loser
# ranker puts teams in hash
# output: prints to stdout


class Ranker
  attr_reader :games, :rankings
  def initialize input
    @games = input.map { |line| line.delete("\n") }
    @rankings = Hash.new 0
  end

  def parse
    @games = @games.map do |game|
      game.sub! /^\d+\)/, ""
      t1, t2 = game.split ","
      team_1 = (/.*(?=:)/).match(t1).to_s.strip!
      team_2 = (/.*(?=:)/).match(t2).to_s.strip!
      score_1 = /\d+/.match(t1).to_s.to_i
      score_2 = /\d+/.match(t2).to_s.to_i
      [team_1, score_1, team_2, score_2]
    end
  end

  def rank
    parse
    @games.each do |game|
      team_1 = game[0]
      score_1 = game[1]
      team_2 = game[2]
      score_2 = game[3]

      @rankings[team_1]
      @rankings[team_2]

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
end

# games = ARGV.each_line
