# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:

# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# How many different ways can £2 be made using any number of coins?

# Recursive

def count_change(amount, coins)
  max = coins[-1]
  case
  when coins.empty? || amount < 0
    0
  when amount == 0 && (not coins.empty?)
    1
  else
    ways_without_max = count_change(amount, coins[0...-1])
    ways_with_max = count_change(amount-max, coins)
    ways_without_max + ways_with_max
  end
end

# p count_change(7, [1, 5])
# p count_change(20, [1,2, 5])
# p count_change(21, [1, 2, 5])
# p count_change(22, [1, 2, 5])
# p count_change(23, [1, 2, 5])
# p count_change(24, [1, 2, 5])

# Dynamic
def change(amount, coins)
  store = initialize_table(amount, coins)
  coins = (1..coins.length + 1).to_a
  values = (1..amount).to_a
  values.each do |value|
    p 'value' => value
    coins.each do |coin_index|
      p coins.inspect
      p 'coin' => coin_value(coin_index)
      sans_coin = store[value][coin_index -1]
      with_coin = store[amount_with_coin(value, coin_index)][coin_index]
      p "a" => sans_coin
      p "b" => with_coin
    end
  end
  p "store", store
end

def amount_with_coin value, coin_index
  amount = value - coin_value(coin_index)
  amount < 0 ? 0 : amount
end

def coin_value index
  coins = [1, 2, 5, 10, 20, 50, 100, 200]
  coins[index-1]
end

def initialize_table(amount, coins)
  i = amount + 1
  j = coins.length + 1
  store = empty_table = Array.new(i) { Array.new(j) }
  store.each do |array|
    array[0] = 0
  end
  no_amount = store.first
  no_amount.each_with_index do |n, i|
    if i == 0
      next
    else
      no_amount[i] = 1
    end
  end
 store
end
