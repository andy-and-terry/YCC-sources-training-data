puts format("%05d|%-5d|%+d", 42, 42, 42)
puts format("%x %o %b %e", 255, 8, 5, 12345.678)
puts format("%08.3f|%.2e|%10.4s|", 3.14159, 0.000123, "abcdefgh")
puts format("%<a>s and %<b>03d", a: "x", b: 7)
puts format("%{a}-%{b}", a: 1, b: 2)
puts format("%c%c", 72, "i")
puts format("%%")
puts format("%s", [1, 2]), format("%p", "str")
puts "%d items" % 3, "%s-%s" % %w[a b]
puts 1234567.89.to_s.reverse.scan(/\d{1,3}/).inspect
puts 12.to_s.rjust(5, "0"), 3.14159.round(2).to_s.ljust(6, "0")
puts format("%.10g", 1.0 / 3)
puts format("% d", 5)
