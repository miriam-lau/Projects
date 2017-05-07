require_relative "card"
require_relative "matching_suits"

class Hand

  include Matching_suits

  royal_flush = [:A, :K, :Q, :J, 10]
  straight_flush = []

  def initialize

  end

end
