def longest_valid_parentheses(string)
  max_length = 0
  counter = 0
  chunk = []
  string.each_char do |el|
    if el == "("
      chunk << el
      counter += 1
    else
      if chunk.length > 0 && counter > 0
        chunk << el
        counter -= 1
      else
        counter -= 1
      end
      if counter < 0
        max_length = chunk.length if chunk.length > max_length
        chunk = []
        counter = 0
      end
    end
  end
  max_length = chunk.length if chunk.length > max_length
  max_length
end

string1 = ")()()()))"
string2 = "(())))((()))"
string3 = ")))"

puts longest_valid_parentheses(string1) == 6
puts longest_valid_parentheses(string2) == 6
puts longest_valid_parentheses(string3) == 0
