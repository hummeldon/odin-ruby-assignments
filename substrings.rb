def substrings(string, dictionary)
  words = Hash.new
  string.downcase!
  dictionary.each do |word|
    match_arr = string.scan(word)
    unless match_arr == []
      words[word] = match_arr.length
    end
  end
  words
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
