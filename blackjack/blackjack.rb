class BlackJack
  attr_reader :hand

  SCORES = {
    "J" => 10,
    "Q" => 10,
    "K" => 10,
    "A" => 11
  }

  BLACKJACK = 21

  def initialize(c_1, c_2)
    @hand = [c_1, c_2]
  end

  def score
    current_score = @hand.reduce(0){ |score, card| score + value(card) }
    aces_count = @hand.count("A")
    while (current_score > BLACKJACK) && aces_count > 0
      current_score -= 10
      aces_count -= 1
    end
    current_score
  end

  def deal(c)
    @hand << c
  end

  private

  def value(c)
    SCORES[c] || c
  end
end

