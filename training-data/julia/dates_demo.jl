using Dates

d = Date(2024, 2, 28)
println(d + Day(2))
println(d + Month(1))
println(dayofweek(d), " ", dayname(d), " ", monthname(d))
println(isleapyear(d), " ", daysinmonth(d))

d2 = Date("2024-12-25", dateformat"yyyy-mm-dd")
println(d2 - d)
println(Dates.value(d2 - d))
println(Dates.format(d2, "dd U yyyy"))

t = DateTime(2024, 1, 1, 13, 30, 15)
println(t + Hour(5))
println(hour(t), ":", minute(t), ":", second(t))
println(firstdayofmonth(d), " ", lastdayofmonth(d))
println(collect(Date(2024, 1, 29):Day(1):Date(2024, 2, 2)))
println(d < d2)
