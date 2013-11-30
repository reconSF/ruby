def no_repeats(year_start, year_end)
  no_repeats = []
  (year_start..year_end).each do |nuts|
    no_repeats << nuts if no_repeat?(nuts)
  end

  no_repeats
end

def no_repeat?(year)
  chars_seen = []
  year.to_s.each_char do |char|
    return false if chars_seen.include?(char)
    chars_seen << char
  end

  return true
end
