# 9/1/14 (7 minutes)
# 9/2/14 (3 hours)

class Ranker
  attr_reader :games, :rankings
  def initialize input
    @games = input.map { |line| line.delete("\n") }
    @rankings = Hash.new 0
  end

  def parse
    @games = @games.map do |game|
      /^\d+\) (?<team_1>.*?): (?<score_1>\d+), (?<team_2>.*?):\s(?<score_2>\d+)/ =~ game
      [team_1, score_1.to_i, team_2, score_2.to_i]
    end
  end

  def rank
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

  def output
    rank
    raw = @rankings.keys.group_by { |team| @rankings[team] }
    ranks = raw.sort_by { |rank, games| rank }
    output = []
    ranks.reverse_each.with_index do |(rank, teams), i|
      teams.sort.each do |team|
        output.push "#{i+1}) #{team}"
      end
    end
    output
  end
end

games = ARGF.each_line
ranker = Ranker.new games
puts ranker.output
