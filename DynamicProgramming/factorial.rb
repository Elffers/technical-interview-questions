require 'benchmark'

def r_factorial n
  return 1 if n == 1
  return 1 if n == 0
  n * r_factorial(n-1)
end

def iter_factorial n
  i = 1 
  product = i
  while i < n
    product = product* i
    i +=1
  end
end


n = 9000
Benchmark.bm do |x|
  #x.report { r_factorial n }
  x.report { iter_factorial  n }
end
