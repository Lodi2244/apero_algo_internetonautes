def solve(array)
  odd = []
  array.each do |element|
    if odd.include?(element)
      odd.delete(element)
    else
      odd.push(element)
    end
  end
  odd.first
end
