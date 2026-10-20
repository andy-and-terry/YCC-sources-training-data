d = ~D[2024-02-28]
IO.inspect(Date.add(d, 2))
IO.inspect(Date.diff(~D[2024-12-25], d))
IO.inspect({Date.day_of_week(d), Date.leap_year?(d), Date.days_in_month(d)})
t = ~T[13:45:10]
IO.inspect(Time.add(t, 3600))
dt = ~U[2024-03-05 10:00:00Z]
IO.inspect(DateTime.add(dt, 86400 * 30, :second))
IO.inspect(DateTime.to_unix(dt))
IO.inspect(Calendar.strftime(dt, "%Y/%m/%d %H:%M"))
IO.inspect(NaiveDateTime.diff(~N[2024-01-02 00:00:00], ~N[2024-01-01 00:00:00]))
IO.inspect(Date.range(~D[2024-01-01], ~D[2024-01-05]) |> Enum.count())
