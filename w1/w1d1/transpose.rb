def my_transpose(matrix)
  transposed = []
  matrix.count.times { transposed << [] }
  matrix.each_with_index do |row_array, row_index|
    # transposed.push []
    row_array.each_with_index do |entry, el_index|
      transposed[el_index][row_index] = entry
    end # row_array
  end # matrix
  transposed
end

# test
def test
  p my_transpose([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ])
end
  
# main
test