def translate(string)
    words = string.split(" ")
    vowels = ["a", "e", "i", "o", "u"]
    phrase = []
    
    words.each do |word|
        if vowels.include?(word[0])
            phrase << word + "ay"
        elsif
            phrase << until_vowel(word)
        end
    end
    return phrase.join(' ')
end

private

def until_vowel(word)
    vowels = ["a", "e", "i", "o", "u"]
    until vowels.include?(word[0])
        if word[0] == "q" && word[1] == "u"
            word = word[2..word.length] + word[0..1]
        else     
            word = word[1..word.length] + word[0]
        end
    end
    
    return word + "ay"
end