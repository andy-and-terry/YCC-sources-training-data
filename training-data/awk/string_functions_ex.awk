BEGIN {
  s = "Hello, World"
  print length(s), toupper(s), substr(s, 8, 5)
  n = split("a:b:c", parts, ":")
  print n, parts[2]
  gsub(/o/, "0", s)
  print s
  print index("banana", "nan")
  printf "%05.1f|%-4s|\n", 3.14159, "ab"
}
