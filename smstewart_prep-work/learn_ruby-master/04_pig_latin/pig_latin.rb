def translate (str)
    vowels = %w{a e i o u}

    str.gsub(/(\A|\s)\w+/) { |s|
        s.strip!
        while not vowels.include? s[0] or (s[0] == 'u' and s[-1] == 'q')
            s += s[0]
            s = s[1..-1]
        end
        s  = ' ' + s + 'ay'
    }.strip
end
