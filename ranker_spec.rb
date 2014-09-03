require_relative 'ranker'

describe Ranker do
  let(:input){ File.readlines('ranker_test_input.txt') }
  let!(:ranker){ Ranker.new input }
  let(:output){ File.readlines('ranker_test_output.txt') }

  context 'initialize' do
    it 'should be an array' do
      expect(ranker.games.count).to eq 6
    end
  end
  context 'parse' do
    it 'parses each line correctly' do
      expect(ranker.parse.first).to eq ["Seahawks", 10, "Patriots", 3]
    end
  end
  context 'rank' do
    it 'ranks the teams correctly' do
      ranker.rank
      expect(ranker.rankings["Seahawks"]).to eq 9
      expect(ranker.rankings["Patriots"]).to eq 1
      expect(ranker.rankings["Cowboys"]).to eq 1
      expect(ranker.rankings["Broncos"]).to eq 4
      expect(ranker.rankings["Ravens"]).to eq 1
      
    end
  end
  context 'output' do
    it 'has one line per team' do
      expect(ranker.output.count).to eq 5
    end
    it 'formats output' do
      expect(ranker.output).to eq output.map {|line| line.delete("\n")}
    end
  end
end
