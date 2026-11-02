if {[regexp {(\d+)-(\d+)} "range 10-20" -> lo hi]} {
    puts "lo=$lo hi=$hi"
}
