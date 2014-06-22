require_relative 'htree'

describe HTree do
  let(:htree) { HTree.new }

  describe HTree::Node do
    let(:node) { HTree::Node.new("foo", "bar") }
    context 'initialize' do
      it 'should have a key and value' do
          expect(node.key).to eq "foo"
      end
    end
    context 'left' do
      it 'should read the left node' do
        expect(node.left.key).to be nil
      end
    end
  end
end
