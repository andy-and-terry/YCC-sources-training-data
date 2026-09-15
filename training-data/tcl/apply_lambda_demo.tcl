set square {{x} {expr {$x * $x}}}
puts [apply $square 5]

set add {{a b} {expr {$a + $b}}}
puts [apply $add 3 4]

set numbers {1 2 3 4 5}
set squared [lmap n $numbers {apply $square $n}]
puts $squared

set isEven {{n} {expr {$n % 2 == 0}}}
set evens [lmap n $numbers {expr {[apply $isEven $n] ? $n : [continue]}}]
puts $evens
