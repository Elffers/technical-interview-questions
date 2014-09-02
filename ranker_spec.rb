require_relative 'ranker'

describe 'Ranker' do
  let(:ranker){ Ranker.new }
  context 'parse' do
    it 'returns the winner first, then loser' do
      line = "1) Team A: 1, Team B: 2"
      expect(ranker.parse line).to eq ["Team B", "Team A"]
    end
    it 'returns both teams if tied' do
      line = "1) Team A: 1, Team B: 1"
      expect(ranker.parse line).to eq ["tie", "Team A", "Team B"]
    end
  end
end
