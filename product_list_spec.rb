require_relative 'product_list'

context 'product_map' do
  it 'works' do
    array = [1, 2, 3]
    expect(product_map array).to eq [6, 3, 2]
  end
end
