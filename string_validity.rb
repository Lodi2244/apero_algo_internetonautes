input1 = "()"              #  true
input2 = ")(()))"          #  false
input3 = "("               #  false
input4 = "(())((()())())"  #  true

def string_validity(string)
  results = []
  string.each_char do |char|
    if char == '('
      results.push(char)
    else
      return false unless results.pop
    end
  end
  results.empty?
end

p string_validity(input1)
p string_validity(input2)
p string_validity(input3)
p string_validity(input4)
