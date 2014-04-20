require_relative "practicing_basics"

describe '.reverse' do
  let(:str1){ HString.new("a")}
  it 'returns self if string size is 1' do
    expect(str1.hreverse).to eq "a"
  end

end