set person [dict create name "Ada" age 36 city "London"]

dict with person {
    incr age
    set city "Paris"
}

puts "Updated dict: $person"
puts "Age after birthday: [dict get $person age]"

set nested [dict create user [dict create name "Grace" scores {90 85 95}]]
dict with nested user {
    lappend scores 100
}
puts "Nested after update: $nested"
