# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:

# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# How many different ways can £2 be made using any number of coins?

# Recursive

def count_change(amount, coins)
  max = coins.first
  case
  when coins.empty? || amount < 0
    0
  when amount == 0 && (not coins.empty?)
    1
  else
# add ways you can make change without largest coin to ways you can make change with largest coin
    #count_change(amount-max, coins)
  end
end

# Dynamic
