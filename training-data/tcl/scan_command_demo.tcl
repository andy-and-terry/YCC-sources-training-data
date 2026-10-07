set line "Alice 30 89.5"
scan $line "%s %d %f" name age score
puts "name=$name age=$age score=$score"

set count [scan "12-25-2024" "%d-%d-%d" month day year]
puts "matched=$count month=$month day=$day year=$year"

set hex "1a"
scan $hex "%x" decimalValue
puts "decimal=$decimalValue"
