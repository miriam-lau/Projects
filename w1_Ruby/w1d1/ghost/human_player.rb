class HumanPlayer
  attr_reader :name

  def initialize
    print "Enter name: "
    @name = gets.chomp
  end

  def take_turn(game)
    input = nil
    while true
      puts "Current word: #{game.fragment}"
      puts "#{@name}, choose your next letter."
      input = gets.chomp
      if game.valid_play?(input)
        break
      end
      puts "\"#{input}\" is an invalid letter"
    end
    input
  end

end
