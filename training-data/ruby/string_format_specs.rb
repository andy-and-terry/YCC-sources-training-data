# Kernel#format / String#% specifiers.
puts format("%5d|%-5d|%05d", 42, 42, 42)
puts format("%+d %+d", 5, -5)
puts format("%.3f %8.2f %-8.1f|", 3.14159, 2.5, 7.25)
puts format("%x %X %#x %o %b %#b", 255, 255, 255, 8, 5, 5)
puts format("%e", 12345.678)
puts format("%10s|%-10s|", "right", "left")
puts format("%.3s", "truncated")
puts format("%c%c", 72, "i")
puts format("%%literal percent")

# Named references work with hashes and are order independent.
puts format("%<name>s is %<age>d", name: "Bo", age: 30)
puts format("%{a}-%{b}", a: 1, b: 2)

# Positional arguments
puts format("%2$s %1$s", "world", "hello")

# Star takes width from the argument list.
puts format("%*d|", 6, 42)

# String#% accepts an array.
puts "%s scored %d%%" % ["Cy", 93]
puts "%.1f" % 2.25
