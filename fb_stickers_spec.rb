require_relative 'fb_stickers'

context "foo" do
  it 'returns correct number of stickers needed' do
    expect(foo "coffee kebab").to eq 3
    expect(foo "book").to eq 1
    expect(foo "ffacebook").to eq 2
  end 
end

context "add_sticker" do
  it "increases count of each letter correctly" do
    counts = {"f" => 1, "a" =>2, "c" => 0, "e" => 0, "b" => 0, "o" => 0,"k" => 0}
    add_sticker(counts)
    expect(counts["f"]).to eq 2
    expect(counts["a"]).to eq 3
    expect(counts["c"]).to eq 1
  end
end

context "count_letters" do
  it "returns correct count for letters" do
    expect(count_letters("faa")).to eq({"f" => 1, "a" =>2})
  end
end

context "bar" do
  it 'returns correct number of stickers needed' do
    expect(bar "coffee kebab").to eq 3
    expect(bar "book").to eq 1
    expect(bar "ffacebook").to eq 2
  end 
end
