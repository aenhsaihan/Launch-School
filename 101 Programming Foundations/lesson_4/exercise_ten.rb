munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, profile|
  age = profile['age']

  if age < 18
    profile.merge!({age_group: 'kid'})
  elsif age > 17 && age < 65
    profile.merge!({age_group: 'adult'})
  else
    profile.merge!({age_group: 'senior'})
  end
end