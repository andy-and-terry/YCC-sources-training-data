new_money <- function(x) structure(list(amt = x), class = "money")
print.money <- function(m, ...) cat(sprintf("$%.2f\n", m$amt))
"+.money" <- function(a, b) new_money(a$amt + b$amt)

print(new_money(1.5) + new_money(2.25))
