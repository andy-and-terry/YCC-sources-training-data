array set ages {ann 30 bob 25}
set ages(cy) 41
foreach name [lsort [array names ages]] { puts "$name $ages($name)" }
puts [array size ages]
puts [info exists ages(zed)]
