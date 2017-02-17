hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, array|
  array.each do |word|
    word.chars.each do |letter|
      puts letter if letter.match(/[aeiou]/)
    end
  end
end
