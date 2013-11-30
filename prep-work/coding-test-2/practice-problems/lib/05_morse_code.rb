def morse_encode(str)
    str.split(' ').map { |word| morse_encode_word(word) }.join("  ").rstrip
end

def morse_encode_word(word)
    puts word
    letters = {
        'a' => '.-',
        'b' => '-...',
        'c' => '-.-.',
        'd' => '-..',
        'e' => '.',
        'f' => '..-.',
        'g' => '--.',
        'h' => '....',
        'i' => '..',
        'j' => '.---',
        'k' => '-.-',
        'l' => '.-..',
        'm' => '--',
        'n' => '-.',
        'o' => '---',
        'p' => '.--.',
        'q' => '--.-',
        'r' => '.-.',
        's' => '...',
        't' => '-',
        'u' => '..-',
        'v' => '...-',
        'w' => '.--',
        'x' => '-..-',
        'y' => '-.--',
        'z' => '--..'
    }
    word.each_char.map { |c| letters[c] }.join(' ').rstrip
end

morse_encode("cat in hat")