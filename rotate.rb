a = [
  [1,2,3],
  [4,5,6],
  [7,8,9]
]

def solution(a)
    length = a.length - 1
    diagonal_mirroring(vertical_mirroring(a, length), length)
end

def vertical_mirroring(matrix, length)
    matrix.each_with_index do |row, index|
        row.each_with_index do |_cell, column|
            break if column == length - column || column > length / 2
            matrix[index][column], matrix[index][(length) - column] = 
            matrix[index][(length) - column], matrix[index][column]
        end 
    end
end

def diagonal_mirroring(matrix, length)
    matrix.each_with_index do |row, index|
        row.each_with_index do |_cell, column|
            break if  [index, column] == [(length - column), (length - index)]
            matrix[index][column], matrix[length - column][length - index] =
            matrix[length - column][length - index], matrix[index][column]
        end
    end
end


