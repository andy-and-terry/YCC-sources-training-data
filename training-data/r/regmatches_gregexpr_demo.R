text <- "Call 555-1234 or 555-9876 before 5pm, ext 42."

m <- gregexpr("[0-9]{3}-[0-9]{4}", text)
print(regmatches(text, m)[[1]])

nums <- regmatches(text, gregexpr("[0-9]+", text))[[1]]
print(as.integer(nums))

emails <- c("ann@example.com", "not-an-email", "bob@test.org")
is_email <- grepl("^[[:alnum:]._-]+@[[:alnum:].-]+\\.[a-z]+$", emails)
print(is_email)

domains <- sub(".*@", "", emails[is_email])
print(domains)

print(regexpr("o", "hello world"))
print(unlist(gregexpr("o", "hello world")))

x <- "2024-03-15"
parts <- regmatches(x, regexec("([0-9]{4})-([0-9]{2})-([0-9]{2})", x))[[1]]
print(parts)

print(gsub("(\\w+)@(\\w+)", "\\2 at \\1", "user@host"))
print(toupper(gsub("(^|\\s)(\\w)", "\\1\\U\\2", "make title case", perl = TRUE)))
print(gsub("(^|\\s)(\\w)", "\\1\\U\\2", "make title case", perl = TRUE))
