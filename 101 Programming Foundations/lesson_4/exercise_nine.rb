words = "the flintstones rock"

def titleize(title)
  capitalized_title = ''

  needs_to_be_capitalized = true
  title.chars.each do |letter|
    if needs_to_be_capitalized
      capitalized_title << letter.upcase
      needs_to_be_capitalized = false
    else
      capitalized_title << letter
    end

    if letter == ' ' then needs_to_be_capitalized = true end
  end

  capitalized_title
end

titleize(words)