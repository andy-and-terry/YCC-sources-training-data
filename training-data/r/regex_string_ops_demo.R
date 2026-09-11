emails <- c("alice@example.com", "not-an-email", "bob.smith@work.org")

is_email <- grepl("^[[:alnum:].]+@[[:alnum:].]+\\.[[:alpha:]]{2,}$", emails)
print(is_email)

valid_emails <- emails[is_email]
print(valid_emails)

domains <- regmatches(valid_emails, regexpr("(?<=@).+", valid_emails, perl = TRUE))
print(domains)

masked <- sub("^[^@]+", "***", valid_emails)
print(masked)
