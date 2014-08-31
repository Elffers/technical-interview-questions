require_relative 'product_list'

context 'product_map' do
  it 'works' do
    array1 = [1, 2, 3]
    array2 = [5, 2, 12, 7]
    expect(product_map array1).to eq [6, 3, 2]
    expect(product_map array2).to eq [168, 420, 70, 120]
  end
end
