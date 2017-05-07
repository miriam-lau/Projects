require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"
require "byebug"

class Game
  def initialize(player)
    @board = Board.new
    @player = player
  end

  def game_setup
    @board.populate
  end

  def play_turn
    previous_guess = @player.prompt
    @board.reveal(previous_guess)
    @board.render
    @player.receive_revealed_card(previous_guess, @board[previous_guess])
    guessed_pos = @player.prompt
    @board.reveal(guessed_pos)
    @board.render
    @player.receive_revealed_card(guessed_pos, @board[guessed_pos])

    if @board[guessed_pos] == @board[previous_guess]
      @player.receive_match(previous_guess, guessed_pos)
    else
      sleep(3)
      @board[guessed_pos].hide
      @board[previous_guess].hide
    end
  end

  def play
    game_setup
    until won?
      system("clear")
      @board.render
      play_turn
    end
    puts "Congratulations!"
  end

  def won?
    @board.grid.flatten.all?(&:face_up)
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "What's your name?"
  name = gets.chomp
  if name == "Computer"
    g = Game.new(Computer.new(name))
  else
    g = Game.new(HumanPlayer.new(name))
  end
  g.play
end
