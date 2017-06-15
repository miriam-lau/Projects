require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  str_map = Hash.new(0)
  for i in 0...string.length do
    str_map[string[i]] += 1
  end
  str_map.each do |key, val|
    str_map.delete(key) if val.even?
  end
  return false if str_map.length >= 2
  true
end
