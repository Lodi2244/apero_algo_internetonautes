require 'pry'

def bubble_sort(arr)
  sorting = true
  while sorting do
    sorting = false
    for i in 0..arr.length-2 do
      if arr[i] > arr[i+1]
        n = arr[i]
        arr[i] = arr[i+1]
        arr[i+1] = n
        sorting = true
      end
    end
  end
  return arr
end

p bubble_sort([3, 3, 1, 6, 5, 5, 1, 2, 2])

def find_missing_number(arr)
  for i in 0..arr.length-2 do
    if arr[i] + 1 != arr[i+1]
      return arr[i] + 1
    end
  end
end

p find_missing_number([1, 1, 3, 3, 5, 5, 6])

def find_duplicates(arr)
  searching = true
  while searching do
    searching = false
    for i in 0..arr.length-2 do
      if arr[i] == arr[i+1]
        searching = true
      end
    end
  end
  return arr[i]
end

p find_duplicates([1, 1, 3, 3, 5, 5, 6])
