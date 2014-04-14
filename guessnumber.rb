@number = rand(1..10)

puts "Guess a number!"
guess = gets
@count = 7
evaluate(guess)

def check_number(num)
  if num.class == Fixnum
    true
  else
    false
  end
end

def evaluate(guess)
  if check_number(guess)
    while @count > 0

      # case @number <=> guess
      # when 1
      #   puts "Higher!"
      #   @count -= 1
      #   puts "Guess again! You have #{@count} guesses left."
      #   guess = gets.to_i
      #   evaluate(guess)
      # when -1
      #   puts "Lower!"
      #   @count -= 1
      #   puts "Guess again! You have #{@count} guesses left."
      #   guess = gets.to_i
      #   evaluate(guess)
      # when 0
      #   puts "You guessed it! The number was #{@number}."
      #   break
      # end
    end
  else
    puts "You must put an integer!"
  end
  if @count == 0
    puts "You are out of turns! The number was #{@number}"
  end
end