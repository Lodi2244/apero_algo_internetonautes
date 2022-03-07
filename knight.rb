
# CHESSBOARD = [
#     [["A", 8], ["B", 8], ["C", 8], ["D", 8], ["E", 8], ["F", 8], ["G", 8], ["H", 8]],
#     [["A", 7], ["B", 7], ["C", 7], ["D", 7], ["E", 7], ["F", 7], ["G", 7], ["H", 7]],
#     [["A", 6], ["B", 6], ["C", 6], ["D", 6], ["E", 6], ["F", 6], ["G", 6], ["H", 6]],
#     [["A", 5], ["B", 5], ["C", 5], ["D", 5], ["E", 5], ["F", 5], ["G", 5], ["H", 5]],
#     [["A", 4], ["B", 4], ["C", 4], ["D", 4], ["E", 4], ["F", 4], ["G", 4], ["H", 4]],
#     [["A", 3], ["B", 3], ["C", 3], ["D", 3], ["E", 3], ["F", 3], ["G", 3], ["H", 3]],
#     [["A", 2], ["B", 2], ["C", 2], ["D", 2], ["E", 2], ["F", 2], ["G", 2], ["H", 2]],
#     [["A", 1], ["B", 1], ["C", 1], ["D", 1], ["E", 1], ["F", 1], ["G", 1], ["H", 1]]
#    ]

KNIGHT_MOVES = {
  right_up: [2, 1],
  up_right: [1, 2],
  left_up: [-2, 1],
  up_left: [-1, 2],
  right_down: [2, -1],
  down_right: [1, -2],
  left_down: [-2, -1],
  down_left: [-1, -2]
}

def on_the_chessboard?(position: {file: nil, rank: nil})
  return position[:file].between?(1,8) && position[:rank].between?(1,8)
end

def alphabetical_to_numerical(letter)
  letter.downcase.ord - 96
end

def numerical_to_alphabetical(number)
  (number + 96).chr.upcase
end

def file(position)
  alphabetical_to_numerical(position.first)
end

def rank(position)
  position.last
end

def solution(origin, destination)
  diff = [-(file(origin) - file(destination)), -(rank(origin) - rank(destination))]
  initial_position = origin.unshift(alphabetical_to_numerical(origin.shift))
  moves = KNIGHT_MOVES.values
  pp combinations = combinations(moves, diff)[:combinations]
  number_of_combinations = combinations(moves, diff)[:number]
  result = combinations.map do |combination|
      current_position = initial_position
      next_position = [current_position, combination].transpose.map(&:sum)
      if on_the_chessboard?(position: {file: next_position.first, rank: next_position.last})
        next_position
      else
        next_position = [current_position, [-combination.first, combination.last]].transpose.map(&:sum)
      end
      initial_position = next_position
    end
  path = result.take(number_of_combinations).map do |array|
    array.unshift(numerical_to_alphabetical((array.shift)))
  end
  { count: number_of_combinations, path: path }
end

def combinations(moves, diff)
  result = { combinations: [], number: nil}
  1.upto(6) do |index|
    return result.merge!(combinations: moves.select { |move| move == diff }, number: index) if index == 1 && result[:combinations].any?
    combinations = moves.repeated_combination(index).to_a.select { |m1,m2,m3,m4,m5,m6| [m1,m2,m3,m4,m5,m6].compact!.transpose.map(&:sum) == diff }.flatten(1)
    return result.merge!(combinations: combinations, number: index) if combinations.any?
  end
end

p solution(["F", 3], ["E", 4])
