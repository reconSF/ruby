# Mean is the average
def mean(array)
    array.inject(0) { |sum, x| sum += x } / array.size.to_f
end

# Median is the middle value
def median(array)
    return nil if array.empty?
    array = array.sort
    m_pos = array.size / 2
    return array.size % 2 == 1 ? array[m_pos] : mean(array[m_pos-1..m_pos])
end

# Mode is number repeated more than any other
def mode(array, find_all=true)
    histogram = array.inject(Hash.new(0)) { |h, n| h[n] += 1; h }
    modes = nil
    histogram.each_pair do |item, times|
        modes << item if modes && times == modes[0] and find_all
        modes = [times, item] if (!modes && times>1) or (modes && times>modes[0])
    end
    return modes ? modes[1...modes.size] : modes
end

arr = [13, 18, 13, 14, 13, 16, 14, 21, 13]

mean = mean(arr)
puts "Mean: " << mean.inspect
# => 15.0

median = median(arr)
puts "Median: " << median.inspect
# => 14

mode = mode(arr)
puts "Mode: " << mode.inspect
# => [13]