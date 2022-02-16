a = [
  [1,2,3],
  [4,5,6],
  [7,8,9]
]

def solution(matrix)
    diagonal_mirroring(vertical_mirroring(matrix))
end

def vertical_mirroring(matrix)
    matrix.each_with_index do |_row, index|
        matrix[index][0], matrix[index][-1] = matrix[index][-1], matrix[index][0]
    end
end

def diagonal_mirroring(matrix)
    length = matrix.length - 1
    matrix.each_with_index do |row, index|
        row.each_with_index do |_cell, column|
            break if  matrix[index][column] == matrix[length - column][length - index]
            matrix[index][column], matrix[length - column][length - index] = matrix[length - column][length - index], matrix[index][column]
        end
    end
end


p swap_positions(matrix, row, column)
