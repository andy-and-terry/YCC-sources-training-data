using Dates

d = Date(2024, 2, 27)
println(d + Day(3))
println(d + Month(1))
println(Dates.dayname(d), " ", Dates.monthname(d))
println(isleapyear(d), " ", daysinmonth(d))
println(dayofyear(d), " ", week(d), " ", quarterofyear(d))

d2 = Date("2024-12-25")
println(d2 - d)
println(Dates.value(d2 - d))

dt = DateTime(2024, 3, 1, 14, 30, 15)
println(dt)
println(format(dt, "yyyy-mm-dd HH:MM"))
println(Date(dt), " ", Time(dt))
println(dt + Hour(10) + Minute(45))

parsed = DateTime("03/15/2024 08:05", dateformat"mm/dd/yyyy HH:MM")
println(parsed)

println(firstdayofmonth(d), " ", lastdayofmonth(d))
println(tonext(d, Monday))
println(collect(Date(2024, 1, 29):Day(1):Date(2024, 2, 2)))
println(filter(x -> dayofweek(x) in (6, 7), Date(2024, 3, 1):Day(1):Date(2024, 3, 10)))
println(Day(90) + Week(1), " ", Dates.canonicalize(Hour(50)))
