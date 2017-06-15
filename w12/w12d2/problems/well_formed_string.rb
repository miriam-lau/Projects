# A string with the characters `[,],{,},(,)` is said to be well-formed if
# the different types of brackets match in the correct order.
# For example, `([]){()}` is well-formed, but `[(]{)}` is not. )( is not well-formed
# Write a function to test whether a string is well-formed.

# perfect situation for a stack
#
# if we store all left brackets in a stack then every time we encounter
# a right bracket, its pair should be on the top of the stack, or else
# it is unmatched.
#
# Additionally, if there are any unmatched left brackets at the end,
# the string is not well-formed.

def well_formed?(str)
  left_chars = []
  lookup = { '(' => ')', '[' => ']', '{' => '}' }

  str.chars.each do |char|
    if lookup.keys.include?(char)
      left_chars.push(char)
    elsif left_chars.length == 0 || lookup[left_chars.pop] != char
      return false
    end
  end
  return left_chars.empty?
end

answer:
def well_formed(str)
    left_chars = []
    lookup = { '(' => ')', '['=> ']', '{'=> '}' }
    
    str.chars.each do |char|
        if lookup.keys.include?(char)
            left_chars << char
            elsif left_chars.length == 0 || lookup[left_chars.pop] != char
            return false
        end
    end
    return left_chars.empty?
end
