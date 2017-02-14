statement = "The Flintstones Rock"

statement.chars.each_with_object({}) do |char, hash|
  hash[char] = hash[char] || 0
  hash[char] += 1
end