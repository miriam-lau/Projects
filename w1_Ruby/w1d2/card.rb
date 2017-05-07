class Card
  attr_reader :face_value, :face_up

  def initialize(face_value)
    @face_up = false
    @face_value = face_value
  end

  def reveal
    @face_up = true
  end

  def hide
    @face_up = false
  end

  def display
    @face_up ? @face_value : '_'
  end

  def ==(guess)
    self.face_value == guess.face_value
  end
end
