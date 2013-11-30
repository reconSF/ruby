def nearest_larger(arr, idx)
    diff = 1

    loop do
        left = idx - diff
        right = idx + diff

        if (left >= 0) && (arr[idx] < arr[left])
            return left
        elsif (right < arr.length) && (arr[idx] < arr[right])
            return right
        elsif (left <= 0) && (right >= arr.length)
            return nil
        end

        diff += 1
    end
end