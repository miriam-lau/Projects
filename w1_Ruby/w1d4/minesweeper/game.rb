class Game

  def initialize(board)
    @board = board
  end

  def prompt
    puts "Pick a position '0,0'"
    gets.chomp.split(",").map(&:to_i)
  end


  def play_turn
    pos = prompt
    if @board[pos] == :b
      puts "You hit a bomb!"
      self.is_over?
    end
  end

  def play

  end

  def is_over?
  
  end
end
