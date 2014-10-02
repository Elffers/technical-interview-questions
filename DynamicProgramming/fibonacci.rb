require 'benchmark'
# Finding the nth Fibonacci number
def recursive_fib n
 return 1 if n == 1
 return 1 if n == 2
 recursive_fib(n-1) + recursive_fib(n-2)
end

def iterative_fib n
  a = 1
  b = 1
  fibs = [a, b]
  while fibs.length < n
    f = a + b
    fibs.push f
    a = b
    b = f
  end
  fibs[n-1]
end

def dynamic_fib n
  fibs = [0,1,1]
  return fibs[n] if n < 3
  i = 3
  while i < n+1
    new = fibs[i-1] + fibs[i-2]
    fibs.push new
    i+=1
  end
  fibs.last
end


if $0 == __FILE__
  n = 40
  Benchmark.bm do |x|
    x.report { dynamic_fib n }
    x.report { recursive_fib n }
    x.report { iterative_fib n }
  end
end


