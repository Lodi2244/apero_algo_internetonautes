require 'set'

def lcs(string_1, string_2)

   return "" if string_1.empty? || string_2.empty?

   result = SortedSet.new 
   string_1.chars.each_with_index do |char_1, index_1|
      string_2.chars.each_with_index do |char_2, index_2|
         if string_1[index_1] == string_2[index_2] 
            result.add?(char_1)
         end 
      end 
   end 
   result.join("")

end

pp lcs("", "" ) # => "" 
pp lcs("abc", "") # => "" 
pp lcs("", "abc") # => "" 
pp lcs("a", "b") # => "" 
pp lcs("a", "a") # => "a" 
pp lcs("abc", "ac") # => "ac" 
pp lcs("abcdef", "abc") # => "abc" 
pp lcs("abcdef", "acf") # => "acf" 
pp lcs("anothertest", "notatest") # => "nottest" 
pp lcs("132535365", "123456789") # => "12356" 
pp lcs("nothardlythefinaltest", "zzzfinallyzzz") # => "final" 
pp lcs("abcdefghijklmnopq", "apcdefghijklmnobq") # => "acdefghijklmnoq" 