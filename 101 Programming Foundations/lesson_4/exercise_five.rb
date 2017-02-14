flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]

flintstones.each_with_index do |name, index|
  puts index if name[0,2] == 'Be'
end
