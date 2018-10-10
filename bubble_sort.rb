def bubble_sort(arr)
  arr_sorted = false
  last_check = arr.length - 2
  while arr_sorted == false
    count = 0
    for i in 0..last_check
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        count += 1
      end
    end
    last_check -= 1
    arr_sorted = true if count == 0
  end
  arr
end

def bubble_sort_by(arr)
  arr_sorted = false
  last_check = arr.length - 2
  while arr_sorted == false
    count = 0
    for i in 0..last_check
      if yield(arr[i], arr[i + 1]) > 0
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        count += 1
      end
    end
    last_check -= 1
    arr_sorted = true if count == 0
  end
  arr
end

puts "Here is the sorted array with the bubble_sort method:"
p bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]

puts "Here is the sorted array with the bubble_sort_by method:"
p bubble_sort_by(["hi","hello","hey"]) { |left,right| left.length - right.length }
# => ["hi", "hey", "hello"]
