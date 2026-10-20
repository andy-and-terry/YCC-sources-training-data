using Dates, Random, Statistics
d = Date(2024, 2, 28)
println(d + Day(2), " ", dayofweek(d), " ", monthname(d), " ", isleapyear(d), " ", Date(2024, 12, 25) - d)
println(format(DateTime(2024, 3, 5, 14, 7), "yyyy-mm-dd HH:MM"), " ", Dates.value(Day(3)), " ", firstdayofmonth(d))
println(Date("2024-03-05") < Date("2024-03-06"), " ", collect(Date(2024, 1, 30):Day(1):Date(2024, 2, 2)))
Random.seed!(1)
r = rand(1:6, 1000)
println(all(1 .<= r .<= 6), " ", length(randperm(5)), " ", 0 <= rand() < 1, " ", length(randstring(8)))
x = [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]
println(mean(x), " ", median(x), " ", var(x), " ", std(x), " ", quantile(x, 0.5), " ", cor(x, x))
println(round(mean(randn(10000)), digits=0) == 0.0, " ", shuffle(MersenneTwister(1), 1:5) |> length)
