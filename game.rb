require '/Users/patrick/Documents/the-odin-project/mastermind/board.rb'

class Game
  
  def initialize()
    @board = Board.new
  end

  def run
    12.times do |tries|
      puts "----------------------------------------------"

      puts "Number of remaining gueses: #{12 - tries}"

      guess = get_guess

      # validate guess
      until valid_guess(guess)
        puts "Invalid guess. Valid colors are Green, Cyan, Red, Yellow, Violet, Orange."
        guess = get_guess
      end

      # turn guess into arr of string
      guess_arr = guess.downcase.split(" ").map(&:strip)

      # get feedback on guess
      feedback = make_guess(guess_arr)

      puts "----------------------------------------------" 
      puts "Exact Matches: #{feedback[0]} , Close Matches: #{feedback[1]}"

      if @board.won?(guess_arr)
        puts "You win! The secret code was #{@board.secret_code}"
        return
      end

    end

    puts "You lose! The secret code was #{@board.secret_code}"

  end

  def get_guess
    puts "Enter your guess 4 color guess (e.g. yellow green orange violet):"
    input = gets.chomp.downcase
    return input
    # .split(" ").map(&:strip)
  end

  def make_guess(guess) # takes array of valid pegs
    @board.feedback(guess)
  end

  def valid_guess(guess)
    Board.valid_input(guess)
  end


end


mastermind = Game.new
mastermind.run