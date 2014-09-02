# 9/1/14 (7 minutes)
#line parser, returns winner and loser
# ranker puts teams in hash
# output: prints to stdout


class Ranker

  def parse game
    game.sub! /^\d+\)/, ""
    team_1, team_2 = game.split ","
    team_1_score = /\d+/.match(team_1).to_s.to_i
    team_2_score = /\d+/.match(team_2).to_s.to_i
    if team_1_score > team_2_score
      winner = (/.*(?=:)/).match(team_1).to_s
      loser = (/.*(?=:)/).match(team_2).to_s
    else
      winner = (/.*(?=:)/).match(team_2).to_s.strip!
      loser = (/.*(?=:)/).match(team_1).to_s.strip!
    end
    return winner, loser
  end
end

# games = ARGV.each_line
