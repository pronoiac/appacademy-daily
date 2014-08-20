def bubble_sort(arr)
  index = 0
  sorted = false
  # arr.length.times do 
  until sorted == true
    sorted = true
    index = 0
    # make one pass
    while index < arr.length - 1
      # p arr
      if arr[index] > arr[index + 1]
        arr[index + 1], arr[index] = arr[index], arr[index + 1]
        sorted = false
      end
      # p sorted
      index += 1    
    end
  end
end

# 65318724
bubble_sort [6, 5, 3, 1, 8, 7, 2, 4]