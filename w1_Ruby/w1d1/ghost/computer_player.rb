class ComputerPlayer
  attr_reader :name

  def initialize(name = "Computer", dictionary)
    @name = name
    @dictionary = get_dictionary(dictionary)
  end

  def get_dictionary(dictionary)
    f = File.open(dictionary)
    f.readlines.map(&:chomp)
  end

  def take_turn(game)

  end

end
