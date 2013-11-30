def word_unscrambler(str, words)
    matches = []

    sorted_str = str.split('').sort
    words.each { |w|
        matches << w if w.split('').sort == sorted_str
    }

    matches
end
