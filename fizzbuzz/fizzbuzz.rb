def fizzbuzz(max)
  (1..max).each do |num|
    if num % 15 == 0
      puts "FIZZBUZZ"
    elsif num % 5 == 0
      puts "BUZZ"
    elsif num % 3 == 0
      puts "FIZZ"
    else
      puts num
    end
  end
end

fizzbuzz(100)
