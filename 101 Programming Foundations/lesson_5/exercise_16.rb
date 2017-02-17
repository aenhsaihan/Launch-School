def generateUUID
  uuid = ''
  hex = '0123456789abcdef'

  36.times do |position|
    if [8,13,18,23].include?(position)
      uuid << '-'
    else
      uuid << hex.chars.sample
    end
  end

  uuid
end

generateUUID