require_relative "human_player"

class Game
  attr_reader :fragment

  def initialize(dictionary, p1 = HumanPlayer.new, p2 = HumanPlayer.new)
    @p1 = p1
    @p2 = p2
    @fragment = ""
    @current_player = @p1
    @dictionary = nil
  end

  def get_dictionary(dictionary = "")
    return @dictionary unless @dictionary.nil?
    f = File.open(dictionary)
    f.readlines.map(&:chomp)
  end

  def switch_player
    if @current_player == @p1
      @current_player = @p2
    else
      @current_player = @p1
    end
  end

  def play
    get_dictionary(dictionary)
    until won?
      letter = @current_player.take_turn(self)
      @fragment << letter
      switch_player
    end
    puts "#{@current_player.name} wins!"
    puts "\"#{@fragment}\" is a word in the dictionary!"
  end

  def valid_play?(letter)
    return false if letter.nil?
    return false if letter.length != 1
    return false if letter.ord < "a".ord || letter.ord > "z".ord
    new_fragment = @fragment + letter
    @dictionary.any? { |word| word.start_with?(new_fragment) }
  end

  def won?
    @dictionary.include?(@fragment)
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new('./dictionary.txt')
  game.play
end
