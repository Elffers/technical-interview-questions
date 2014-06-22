require_relative 'htree'

describe HTree do
  let(:htree) { HTree.new }

  context 'insert' do
    it 'should set root to node if no nodes' do
      htree.insert("foo", "bar")
      expect(htree.root.key).to eq "foo"
    end
  end

  describe HTree::Node do
    let(:node) { HTree::Node.new("foo", "bar") }
    context 'initialize' do
      it 'should have a key and value' do
          expect(node.key).to eq "foo"
      end
    end
    context 'left' do
      it 'should read the left node' do
        htree.insert("foo", "bar")
        htree.insert("fod", "bat")
        expect(htree.root.left).to be_an_instance_of HTree::Node
      end
    end

    context 'right' do
      it 'should read the right node' do
        htree.insert("foo", "bar")
        htree.insert("for", "bam")
        
        expect(htree.root.right).to be_an_instance_of HTree::Node
      end
    end
  end
end
