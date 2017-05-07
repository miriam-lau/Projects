require "byebug"
require_relative "card.rb"

class Board

  CARD = {
    "blue" => :b,
    "red" => :r
  }

  attr_reader :grid

  def initialize(grid = Array.new(2) { Array.new(2) })
    @display_grid = []
    @grid = grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def place_card(face_value)
    x_pos = rand(2)
    y_pos = rand(2)
    pos = [x_pos, y_pos]
    until self[pos].nil?
      x_pos = rand(2)
      y_pos = rand(2)
      pos = [x_pos, y_pos]
    end
    self[pos] = Card.new(face_value)
  end

  def populate
    CARD.keys[0...-1].each do |face_value|
      2.times do
        self.place_card(face_value)
      end
    end
    (0...grid.length).each do |row|
      (0...grid.length).each do |col|
        @grid[row][col] = Card.new(CARD.keys.last) if @grid[row][col].nil?
      end
    end
    @grid
  end

  def reveal(pos)
    unless self[pos].face_up
      puts self[pos].reveal
      puts self[pos].face_value
    end
  end

  def render
    display = []
    (0...grid.length).each do |row|
      current_array = []
      (0...grid.length).each do |col|
        current_array << @grid[row][col].display
      end
      display << current_array
    end
    display.each { |row| p row }
  end

end
