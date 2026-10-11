puts [format "%5d|" 42]
puts [format "%-5d|" 42]
puts [format "%05d|" 42]
puts [format "%+d" 7]
puts [format "%8.3f|" 3.14159]
puts [format "%-10s|%10s|" left right]
puts [format "%x %X %o" 255 255 8]
puts [format "%e" 12345.678]
puts [format "%c%c%c" 84 99 108]
puts [format "%*d" 6 99]

foreach {name price} {apple 1.5 watermelon 12.25} {
    puts [format "%-12s \$%7.2f" $name $price]
}
