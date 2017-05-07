class ComputerPlayer

  def initialize(name = "Computer")
    @name = name
    @known_cards= {}
    @matched_cards = []
  end

  def receive_revealed_card(pos, value)
    @known_cards[pos] = value
  end

  def receive_match(pos1, pos2)
    @matched_cards << pos1
    @matched_cards << pos2
  end

  def prompt
    guess = [rand(2), rand(2)] if @known_cards.length == 0
    @known_cards.each do |pos, value|


  end


end
