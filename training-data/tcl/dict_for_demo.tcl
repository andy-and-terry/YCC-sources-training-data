set stock [dict create apples 12 pears 0 plums 7]

dict for {item qty} $stock {
    if {$qty == 0} {
        puts "$item: out of stock"
    } else {
        puts "$item: $qty"
    }
}

set total 0
dict for {_ qty} $stock { incr total $qty }
puts "total = $total"
