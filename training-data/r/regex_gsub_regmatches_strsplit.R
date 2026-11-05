s <- "tel: 555-1234 and 555-9876"
print(regmatches(s, gregexpr("[0-9]{3}-[0-9]{4}", s))[[1]])
print(gsub("[0-9]", "#", s))
print(strsplit("a,b;c", "[,;]")[[1]])
print(sprintf("%05.1f|%-4s|", 3.14159, "ab"))
