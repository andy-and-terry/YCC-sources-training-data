if {[catch {expr {1 / 0}} err]} {
    puts "error: $err"
}
