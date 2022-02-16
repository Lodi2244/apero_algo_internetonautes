MATRIX = [
  [1,1,0,0,0],
  [1,1,0,0,0],
  [0,0,1,0,0],
  [0,0,0,1,1]
]

def solution
  count = 0
  MATRIX.each_with_index do |row, row_index|
    row.each_with_index do |column, column_index|
      count += check_surroundings(row: row_index, column: column_index)
    end
  end
  count
end

def check_surroundings(row: , column:)
  return 0 if row > MATRIX.length - 1 || row < 0 || column > MATRIX.first.length - 1 || column < 0
  return 0 if MATRIX[row][column] == 0
  MATRIX[row][column] = 0
  check_surroundings(row: row + 1, column: column)
  check_surroundings(row: row - 1, column: column)
  check_surroundings(row: row, column: column + 1)
  check_surroundings(row: row, column: column - 1)
  return 1
end
