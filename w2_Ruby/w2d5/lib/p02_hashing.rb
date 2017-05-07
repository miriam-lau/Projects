class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_value = 533000401
    self.each_with_index do |str, i|
      hash_value ^= str.hash + i.hash
    end

    hash_value
  end
end

class String
  def hash
    # self.chars.map { |char| char.ord.hash.to_s }.join('').to_i
    hash_value = 533000401
    self.split("").each_with_index do |char, i|
      hash_value ^= char.ord.hash + i.hash
    end

    hash_value
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_value = 533000401
    self.keys.sort.each do |key|
      hash_value ^= key.hash + self[key].hash
    end
    hash_value
  end
end
