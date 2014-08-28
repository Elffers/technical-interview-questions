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
