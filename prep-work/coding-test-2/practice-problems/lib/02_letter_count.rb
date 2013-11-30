# Given a sentence containing multiple words, find the frequency of a given word in that sentence.
# Construct a method named 'find_frequency' which accepts two arguments 'sentence' and 'word'
# both of which are String objects.

def letter_count(str)
    counts = Hash.new

    str.each_char { |c|
        next if c == " "
        counts[c] = 0 unless counts.include?(c)
        counts[c] += 1
    }

    counts
end
