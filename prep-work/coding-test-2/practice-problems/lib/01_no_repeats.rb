def no_repeats(year_start, year_end)
    no_repeats = []

    (year_start..year_end).each { |yr|
        no_repeats << yr if no_repeat?(yr)
    }

    no_repeats
end

def no_repeat?(yr)
    chars = []

    yr.to_s.each_char { |c|
        return false if chars.include?(c)
        chars << c
    }

    return true
end
