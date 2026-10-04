date = ~D[2024-02-27]
IO.inspect(date)
IO.inspect(Date.add(date, 3))
IO.inspect(Date.day_of_week(date))
IO.inspect(Date.leap_year?(date))
IO.inspect(Date.days_in_month(date))
IO.inspect(Date.diff(~D[2024-12-25], date))
IO.inspect(Date.compare(date, ~D[2025-01-01]))

time = ~T[13:45:30]
IO.inspect(Time.add(time, 90, :minute))

dt = ~U[2024-03-10 08:00:00Z]
IO.inspect(DateTime.add(dt, 86_400, :second))
IO.inspect(DateTime.to_unix(dt))
IO.inspect(DateTime.to_date(dt))

{:ok, parsed} = Date.from_iso8601("2030-07-04")
IO.inspect(parsed.year)
IO.inspect(Date.range(~D[2024-01-01], ~D[2024-01-05]) |> Enum.map(& &1.day))
IO.puts(Calendar.strftime(dt, "%Y/%m/%d %H:%M"))
