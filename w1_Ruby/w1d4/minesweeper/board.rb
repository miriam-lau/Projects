require_relative "tile"

class Board

  def initialize
    #@grid = Array.new(9) { Array.new(9, "*") }
    @grid = Array.new(9) { Array.new(9, Tile.new(:*))}
  end

  # def place_bombs
  #   num_bombs_placed = 0
  #   while num_bombs_placed < 10
  #     pos = [rand(9), rand(9)]
  #     unless self[pos].value == :b
  #       self[pos].value = :b
  #       num_bombs_placed += 1
  #     end
  #   end
  # end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def render

  end

  def test
    @grid.each {|x| puts x}
  end
end

b = Board.new
#b.place_bombs
p b.test
# f == flag
# b == bomb
