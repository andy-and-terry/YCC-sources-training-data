text <- "Contact: alice@example.com, bob@work.org"
pattern <- "[[:alnum:]._-]+@[[:alnum:].-]+"

matches <- regmatches(text, gregexpr(pattern, text))[[1]]
print(matches)

date_text <- "Meeting on 2024-05-01 and 2024-06-15"
date_pattern <- "([0-9]{4})-([0-9]{2})-([0-9]{2})"
first_match <- regmatches(date_text, regexpr(date_pattern, date_text))
print(first_match)
