class HumanPlayer

  def initialize(name)
    @name = name
  end

  def prompt
    puts "Please input a position '0,0'."
    gets.chomp.split(",").map(&:to_i)
  end

  def receive_revealed_card(pos, value)
  end

  def receive_match(pos1, pos2)
  end

end
