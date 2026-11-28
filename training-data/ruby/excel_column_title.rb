def column_title(n)
  title = +""
  while n > 0
    n -= 1
    title.prepend((65 + n % 26).chr)
    n /= 26
  end
  title
end

puts column_title(28), column_title(701) # AB, ZY
