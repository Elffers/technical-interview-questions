require_relative 'htree'

describe HTree do
  let(:htree) { HTree.new }
  before do 
    htree.insert(5, "bar")
  end

  context 'traverse' do
    xit 'should read keys from left to right' do
      htree.insert(3, "bat")
      htree.insert(1, "bax")
      expect(htree.traverse).to eq %w(fan fod foo)
    end
  end

  context 'insert' do
    it 'should set root to node if no nodes' do
      expect(htree.root.key).to eq 5
    end

    it 'should insert node to the left correctly' do
      htree.insert(3, "bat")
      htree.insert(1, "bax")
      expect(htree.root.left.key).to eq 3
      expect(htree.root.left.left.key).to eq 1
    end

    it 'should insert node to the right correctly' do
      htree.insert(7, "bat")
      htree.insert(9, "ban")
      expect(htree.root.right.key).to eq 7
      expect(htree.root.right.right.key).to eq 9
    end
    
    it 'should insert right and left children correctly on same node' do
      htree.insert(3, "bat")
      htree.insert(9, "ban")
      expect(htree.root.right.key).to eq 9
      expect(htree.root.left.key).to eq 3
    end

    # if keys of two nodes inserted are both less than the root,
    # it the root of tree should rearrange itself
  end

  describe HTree::Node do
    let(:node) { HTree::Node.new(1, "bar") }
    
    context 'initialize' do
      it 'should have a key and value' do
         expect(node.key).to eq 1
      end
    end

    context 'left' do
      it 'should read the left node' do
        htree.insert(3, "bat")

        expect(htree.root.left).to be_an_instance_of HTree::Node
      end
    end

    context 'right' do
      it 'should read the right node' do
        htree.insert(7, "bam")
        
        expect(htree.root.right).to be_an_instance_of HTree::Node
      end
    end
  end
end
