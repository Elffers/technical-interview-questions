require_relative 'blackjack'

describe BlackJack do
  let(:blackjack) { BlackJack.new(10, 5) }
  let(:blackjack2) { BlackJack.new(10, "J") }
  let(:blackjack3) { BlackJack.new("A", 7) }
  let(:blackjack4) { BlackJack.new("A", "A") }

  describe '#score_hand' do
    it "scores the cards" do
      expect(blackjack.score).to eq 15
    end

    it "scores face cards" do
      expect(blackjack2.score).to eq 20
    end

    it "scores with a high Ace" do
      expect(blackjack3.score).to eq 18
    end

    it "scores with a low Ace" do
      blackjack2.deal("A")
      expect(blackjack2.score).to eq 21
    end

    it "scores all the cards" do
      blackjack.deal 5
      expect(blackjack.score).to eq 20
    end

    it "correctly scores hands with more than one ace" do
      expect(blackjack4.score).to eq 12

      blackjack4.deal "A"
      expect(blackjack4.score).to eq 13

      blackjack4.deal "A"
      expect(blackjack4.score).to eq 14

      blackjack4.deal "J"
      expect(blackjack4.score).to eq 14
    end
  end

  describe "#deal" do
    let(:blackjack) { BlackJack.new(10, 5) }
    it "adds a new card to the hand" do
      blackjack.deal 5
      expect(blackjack.hand).to eq [10, 5, 5]
    end
  end
end
