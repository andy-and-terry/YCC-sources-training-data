function max(a, b) { return a > b ? a : b }
{ m = max(m, $1) }
END { print "max =", m }
