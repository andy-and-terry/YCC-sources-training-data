proc escape {cr ci} {
    set zr 0.0; set zi 0.0
    for {set n 0} {$n < 30} {incr n} {
        if {$zr * $zr + $zi * $zi >= 4} { return $n }
        set t [expr {$zr * $zr - $zi * $zi + $cr}]
        set zi [expr {2 * $zr * $zi + $ci}]
        set zr $t
    }
    return 30
}
for {set yi -5} {$yi <= 5} {incr yi} {
    set line ""
    for {set xi -40} {$xi <= 12} {incr xi} {
        append line [expr {[escape [expr {$xi / 20.0}] [expr {$yi / 5.0}]] == 30 ? "#" : "."}]
    }
    puts $line
}
