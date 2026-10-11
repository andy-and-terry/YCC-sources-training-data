set text "order 66 shipped 12 items on day 7"

puts [regexp -all -inline {\d+} $text]
puts [regexp -all {\d+} $text]

set log "a=1, b=22, c=333"
foreach {whole key val} [regexp -all -inline {(\w)=(\d+)} $log] {
    puts "$key -> $val"
}

puts [regexp -inline -nocase {h(el+)o} "Say HELLO"]
