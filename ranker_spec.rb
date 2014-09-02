require_relative 'ranker'

describe Ranker do
  let(:input){ File.readlines('ranker_test_input.txt')}
  let!(:ranker){ Ranker.new input }

  context 'initialize' do
    it 'should be an array' do
      expect(ranker.games.count).to eq 4
    end
  end
  context 'parse' do
    it 'parses each line correctly' do
      expect(ranker.parse.first).to eq ["Seahawks", 10, "Patriots", 3]
    end
  end
  context 'rank' do
    xit 'ranks the teams correctly' do
    end
  end
end
