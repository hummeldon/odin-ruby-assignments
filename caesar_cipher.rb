def caesar_cipher(string, key)
  string_characters = string.split("")
  solution = ""
  string_characters.each do |character|
    if character =~ /[a-z]/ || character =~ /[A-Z]/
      character = character.ord
      if character + key > 90 && character <= 90 || character + key > 122
        character -= 26
      end
      character += key
    end
    solution += character.chr
  end
  solution
end

puts caesar_cipher("What a string!", 5)
# => "Bmfy f xywnsl!"
