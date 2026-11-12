set l {pear fig banana}
puts [lsort $l]
puts [lsearch $l fig]
puts [llength $l]
puts [lreplace $l 0 0 apple]
puts [join [lmap w $l {string length $w}] ,]
