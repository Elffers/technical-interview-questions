# 9/1/14 (7 minutes)
#line parser, returns winner and loser
# ranker puts teams in hash
# output: prints to stdout


class Ranker
  attr_reader :games
  def initialize input
    @games = input.map { |line| line.delete("\n") }
  end

  def parse
    @games.map do |game|
      game.sub! /^\d+\)/, ""
      t1, t2 = game.split ","
      team_1 = (/.*(?=:)/).match(t1).to_s.strip!
      team_2 = (/.*(?=:)/).match(t2).to_s.strip!
      score_1 = /\d+/.match(t1).to_s.to_i
      score_2 = /\d+/.match(t2).to_s.to_i
      [team_1, score_1, team_2, score_2]
    end
  end

  def ranker(team_1, score_1, team_2, score_2)
    if score_1 > score_2
      winner = team_1
      loser = team_2
      return winner, loser
    elsif team_1_score < team_2_score
      winner = team_2_name
      loser = team_1_name
      return winner, loser
    else
      t1 = team_1_name
      t2 = team_2_name
      return "tie",t1, t2
    end
  end
end

# games = ARGV.each_line
