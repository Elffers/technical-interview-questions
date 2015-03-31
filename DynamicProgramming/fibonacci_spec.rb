require_relative 'fibonacci'

context 'iterative fib' do
  it 'returns nth fib number' do
    expect(iterative_fib 1).to eq 1
    expect(iterative_fib 2).to eq 1
    expect(iterative_fib 6).to eq 8
    expect(iterative_fib 6).to eq 8
    expect(iterative_fib 7).to eq 13
  end
end
context 'recursive fib' do
  it 'returns nth fib number' do
    expect(recursive_fib 1).to eq 1
    expect(recursive_fib 2).to eq 1
    expect(recursive_fib 6).to eq 8
    expect(recursive_fib 7).to eq 13
  end
end
context 'dynamic fib' do
  it 'returns nth fib number' do
    expect(dynamic_fib 1).to eq 1
    expect(dynamic_fib 2).to eq 1
    expect(dynamic_fib 6).to eq 8
    expect(dynamic_fib 7).to eq 13
  end
end
