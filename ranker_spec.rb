require_relative 'ranker'

context 'parse' do
  it 'returns the winner first, then loser' do
    r = Ranker.new
    line = "1) Team A: 1, Team B: 2"
    expect(r.parse line).to eq ["Team B", "Team A"]
  end
end
