def solution(array)
  positives = array.select {|value| value.positive? }
  min = positives.min || 2
  missings = (min..array.length).to_a
  biggest = 1
  array.each do |element|
    biggest = element if element > biggest
    missings.delete(element) if missings.include?(element)
    missings.push(biggest + 1) if missings.empty?
    missings.push(min - 1) if (min - 1).positive?
  end
  missings.min
end

p solution([3, 4, -1, 1]) # => 2
p solution([3, 4, 2, 1]) # => 5
p solution([1, 2, 0]) # => 3
p solution([5, 3, 4, 6, -2, 7]) # => 2
p solution([0, 10, 2, -10, -20]) # => 1
p solution([-10, -20, -2, -5]) # => 1
