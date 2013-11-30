# Given a sentence, return true if the sentence is a palindrome
# Ignore whitespace and cases of characters.

def palindrome?(sentence)
    downcase_stripped_sentence = sentence.downcase.gsub(" ", "")
    downcase_stripped_sentence  ==  downcase_stripped_sentence.reverse
end