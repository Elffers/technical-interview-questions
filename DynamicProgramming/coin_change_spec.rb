require_relative 'coin_change'

context 'recursive solution' do
let(:coins){ [1, 2, 5, 10, 20, 50, 100, 200] }

  it 'returns 0 if there are no coins' do
    expect(count_change(1, [])).to eq 0
    expect(count_change(5, [])).to eq 0
  end

  it 'returns 0 solution if amount is negative' do
    expect(count_change(-1, [1])).to eq 0
    expect(count_change(-3, [1,5])).to eq 0
  end

  it 'returns 1 solution if amount is 0' do
    expect(count_change(0, [1])).to eq 1
    expect(count_change(0, [1,5])).to eq 1
  end

  it 'returns 1 solution if amount is less than largest coin' do
    expect(count_change(4, [1])).to eq 1
    expect(count_change(4, [1, 5])).to eq 1
    expect(count_change(3, [1, 5])).to eq 1
    expect(count_change(5, [1, 5])).to eq 2
    expect(count_change(7, [1, 5])).to eq 2
    expect(count_change(10, [1, 5, 10])).to eq 4
    expect(count_change(100, [1, 5, 10, 25, 50])).to eq 292
  end
end

context 'dynamic solution' do

end

context 'intialize table' do
let(:coins){ [1, 2, 5, 10, 20, 50, 100, 200] }
  it 'sets first row correctly' do
    expect(initialize_table(2, coins).first).to eq [0,1, 1, 1, 1, 1, 1, 1, 1]
  end
end
