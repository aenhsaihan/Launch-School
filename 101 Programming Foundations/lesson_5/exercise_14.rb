hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_arr = []
hsh.each do |produce, details|
  if details[:type] == 'fruit'
    new_arr << details[:colors].map do |color|
      color.capitalize
    end
  end

  new_arr << details[:size].upcase if details[:type] == 'vegetable'
end
new_arr