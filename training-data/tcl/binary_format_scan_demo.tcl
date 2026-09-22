set numbers {1 2 3 4}
set packed [binary format "I*" $numbers]
puts [string length $packed]

binary scan $packed "I*" unpacked
puts $unpacked

set text [binary format "a5" "Hello"]
binary scan $text "a5" decoded
puts $decoded

set header [binary format "cSS" 1 300 65535]
binary scan $header "cSS" flag width height
puts "$flag $width $height"
