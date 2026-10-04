d = ~D[2024-02-27]
IO.inspect(d)
IO.inspect(Date.add(d, 3))
IO.inspect(Date.day_of_week(d))
IO.inspect(Date.leap_year?(d))
IO.inspect(Date.diff(~D[2024-12-25], d))
IO.inspect(Date.compare(d, ~D[2025-01-01]))
IO.inspect(Date.beginning_of_month(d))
IO.inspect(Date.end_of_month(d))
IO.inspect(Date.from_iso8601!("2023-07-04"))

t = ~T[13:45:30]
IO.inspect(Time.add(t, 3600, :second))
IO.inspect(Time.to_string(t))

dt = ~U[2024-02-27 08:30:00Z]
IO.inspect(DateTime.add(dt, 2 * 86_400))
IO.inspect(DateTime.to_unix(dt))
IO.inspect(DateTime.diff(~U[2024-02-28 08:30:00Z], dt, :hour))

n = ~N[2024-01-01 00:00:00]
IO.inspect(NaiveDateTime.add(n, 90, :minute))
IO.inspect(Calendar.strftime(dt, "%Y/%m/%d %H:%M"))
