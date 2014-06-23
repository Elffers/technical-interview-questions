require_relative 'htree'

describe HTree do
  let(:htree) { HTree.new }
  before do 
    htree.insert("foo", "bar")
  end

  context 'insert' do
    it 'should set root to node if no nodes' do
      expect(htree.root.key).to eq "foo"
    end

    it 'should insert node in correct place' do
      htree.insert("fod", "bat")
      htree.insert("fan", "bax")
      expect(htree.root.left.key).to eq "fod"
      expect(htree.root.left.left.key).to eq "fan"
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
        htree.insert("fod", "bat")

        expect(htree.root.left).to be_an_instance_of HTree::Node
      end
    end

    context 'right' do
      it 'should read the right node' do
        htree.insert("for", "bam")
        
        expect(htree.root.right).to be_an_instance_of HTree::Node
      end
    end
  end
end
