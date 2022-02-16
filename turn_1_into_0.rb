MATRIX = [
	[0, 1, 0, 1, 0, 1, 0, 0],
	[0, 1, 0, 1, 0, 0, 0, 1],
	[1, 1, 1, 1, 0, 1, 1, 0],
	[1, 1, 1, 0, 1, 1, 1, 0],
	[0, 1, 0, 1, 0, 0, 0, 1]
]

def solution
  handle_upper_border
  handle_lower_border
  handle_right_border
  handle_left_border
  MATRIX.each_with_index do |array, row_index|
    array.each_with_index do |element, column_index|
      if element == 2
        MATRIX[row_index][column_index] = 0
      end
    end
  end
end


def handle_upper_border
  MATRIX.first.each_with_index do |element, index|
    change_element(row: 0, column: index, direction: :down)
  end
end

def handle_lower_border
  MATRIX.last.each_with_index do |element, index|
    change_element(row: MATRIX.length - 1, column: index, direction: :up)
  end
end

def handle_left_border
  MATRIX.each_with_index do |element, row_index|
    change_element(row: row_index, column: 0, direction: :right)
  end
end

def handle_right_border
  MATRIX.each_with_index do |element, row_index|
    change_element(row: row_index, column: MATRIX[row_index].length - 1, direction: :left)
  end
end

def change_element(row: , column: , direction: )
  return unless MATRIX[row][column] == 1 ||  MATRIX[row][column] == 2
  MATRIX[row][column] = 2

  case direction
    when :down
      change_element(row: row + 1, column: column, direction: direction) unless row + 1 == MATRIX.length
    when :up
      change_element(row: row - 1, column: column, direction: direction) unless row - 1 < 0
    when :right
      change_element(row: row, column: column + 1, direction: direction) unless column + 1 == MATRIX.first.length
    when :left
      change_element(row: row, column: column - 1, direction: direction) unless column - 1 < 0
  end
end
