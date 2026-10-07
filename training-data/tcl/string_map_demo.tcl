set text "the cat sat on the mat"
puts [string map {cat dog mat rug} $text]

# string map applies all pairs in a single pass, so swaps work
puts [string map {a b b a} "abba cab"]

puts [string map -nocase {HELLO bye} "Hello world"]

set template "Dear @name@, your balance is @amount@."
puts [string map [list @name@ Alice @amount@ \$42.50] $template]
