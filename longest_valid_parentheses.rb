def longest_valid_parentheses(string)
  max_length = 0
  length = 0
  counter = 0
  
end

string1 = ")()()()))"
string2 = "(())))((()))"
string3 = ")))"

puts longest_valid_parentheses(string1) == 6
puts longest_valid_parentheses(string2) == 6
puts longest_valid_parentheses(string3) == 0
