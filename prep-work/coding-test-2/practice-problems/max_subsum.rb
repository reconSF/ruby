def max_subsum(num_array)
    result = [] # Array to hold final answer

    combined = num_array.join(" ")
    nums = num_array

    # Initialize values for processing arrays
    final = []
    max = 0

    count = 0
    until nums.length == 2 # Process sub arrays and find the largest sum
        until count == nums.length
            if nums[count..-1].to_a.inject(:+).to_i > max # Adds all values
                max = nums[count..-1].inject(:+)
                puts "Max: " << max.to_s
                final = nums[count..-1]
                puts "Final: " << final.inspect
            end
            count += 1
        end
        nums.delete_at(-1)
        puts "Nums: " + nums.inspect
        puts "Final: " + final.inspect
        count = 0
    end

    num_array = combined.split(/ /)


    num_array.map! { |x|
        x = x.to_i
    }
    puts "End Num_array: " + num_array.inspect
    puts "End Final_array: " << final.inspect

    # Add results of start and end indeces
    result[0] = num_array.index(final[0]) # Returns min of num_array from final array
    puts "result[0]: " << result[0].to_s
    result[1] = num_array.index(final[-1]) # Returns max of num_array from final array
    puts "result[1]: " << result[1].to_s

    result # Return result

end

max_subsum([100, -101, 200, -3, 1000])
