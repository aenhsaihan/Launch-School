[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

# using any would return true for any instance where the hash returned true, as opposed to returning true if none of the hashes returned false or nil.
# the result would then be
# => [{ a: 'ant', b: 'elephant' }, { c: 'cat' }]