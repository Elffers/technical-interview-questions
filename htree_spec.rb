require_relative 'htree'

describe HTree do
  let(:htree) { HTree.new }
  context 'initialize' do
    it 'has a root node' do
      expect(htree.root).to be_an_instance_of Hash
    end
  end

  context 'get' do
    it 'reads the value of a given key' do
    end
  end
end
