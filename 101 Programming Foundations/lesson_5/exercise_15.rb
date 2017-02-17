arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = []
arr.each do |hsh|
  all_even = true
  hsh.values.each do |array|
    if array.any? { |num| num.odd? }
      all_even = false
    end
  end

  new_arr << hsh if all_even
end
new_arr
