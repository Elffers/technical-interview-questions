require_relative "practicing_basics"

describe '.reverse' do
  let(:str1){ HString.new("a")}
  let(:str2){ HString.new("abcde")}
  it 'returns self if string size is 1' do
    expect(str1.reverse).to eq "a"
  end

  it 'returns a reversed string' do
    expect(str2.reverse).to eq "edcba"
  end

end