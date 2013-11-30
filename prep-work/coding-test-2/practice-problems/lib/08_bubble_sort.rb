def bubble_sort(arr)
    sorted = false

    until sorted
        sorted = true

        (arr.length - 1).times { |x|
            if arr[x] > arr[x + 1]
                arr[x], arr[x + 1] = arr[x + 1], arr[x]
                sorted = false
            end
        }
    end

    arr
end