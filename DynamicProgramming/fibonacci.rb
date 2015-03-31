require 'benchmark'

# Finding the nth Fibonacci number

def recursive_fib n
 return 1 if n == 1 || n == 2
 recursive_fib(n-1) + recursive_fib(n-2)
end

def iterative_fib n
  if n == 1 || n == 2
    return 1
  end
  a = 0
  b = 1
  (n-1).times do
    f = a + b
    a = b
    b = f
  end
  b
end

def dynamic_fib n
  fibs = [0,1,1]
  return fibs[n] if fibs[n]
  i = 3
  while i < n+1
    new = fibs[i-1] + fibs[i-2]
    fibs.push new
    i+=1
  end
  fibs[n]
end

 if $0 == __FILE__
   n = 40
   Benchmark.bm do |x|
     x.report { recursive_fib 10 }
     x.report { recursive_fib 20 }
     x.report { recursive_fib 30 }
     x.report { recursive_fib 45 }
   end
 end
