# colors = [green, cyan, red, yellow, violet, orange]
# computer generates a random code of length 4
# player gives guess 
# computer gives feedback on the guess
  # red for correct color & place
  # white for correct color but not place
  # empty for incorrect color
# player has 12 tries to guess

class Board
  attr_reader :secret_code
  COLORS = %w[green cyan red yellow violet orange].freeze

  def initialize()
    @secret_code = Array.new(4) {COLORS.sample}
  end

  def exact_matches(guess)
    matches = 0

    (0...@secret_code.length).each do |peg_idx|
      matches += 1 if @secret_code[peg_idx] == guess[peg_idx]
    end

    matches
  end

  def close_matches(guess)
    color_matches = 0
    secret = @secret_code[0..-1]

    (0...secret.length).each do |peg_idx|
      if secret.include?(guess[peg_idx])
        secret[peg_idx] = ""
        color_matches += 1
      end
    end

    color_matches - exact_matches(guess)
  end

  def Board.valid_input(str)
    pegs = str.split(" ").map(&:strip)
    re = /^(green|cyan|red|yellow|violet|orange)$/i
    pegs.all?{|peg| peg.match(re)} && pegs.length == 4
  end

  def won?(guess)
    @secret_code == guess
  end

  def feedback(guess)
    [exact_matches(guess), close_matches(guess)]
  end


end