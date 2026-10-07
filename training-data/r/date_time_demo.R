start_date <- as.Date("2024-01-15")
end_date <- as.Date("2024-03-01")

print(end_date - start_date)
print(as.numeric(difftime(end_date, start_date, units = "days")))

print(format(start_date, "%B %d, %Y"))
print(weekdays(start_date))

next_week <- start_date + 7
print(next_week)

dates <- seq(start_date, by = "month", length.out = 4)
print(dates)

df <- data.frame(event = c("launch", "review", "release"), date = c(start_date, next_week, end_date))
df <- df[order(df$date), ]
print(df)
