class Tile

attr_reader :value

  def initialize(value)
    @bombed = false
    @flagged = false
    @revealed = false
    @value = value
  end

  def reveal
    @revealed
  end

  def neighbors
  end

  def neighbor_bomb_count
  end

  def is_bomb?
  end

  def value=(value)
    @value = value
  end

end
