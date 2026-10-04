d = ~D[2024-02-28]

IO.inspect(Date.add(d, 2))
IO.inspect(Date.day_of_week(d))
IO.inspect(Date.leap_year?(d))
IO.inspect(Date.diff(~D[2024-12-25], d))
IO.inspect(Date.compare(d, ~D[2025-01-01]))
IO.inspect(Date.range(d, Date.add(d, 3)) |> Enum.map(&Date.to_string/1))

t = ~T[13:45:10]
IO.inspect(Time.add(t, 3600))

dt = DateTime.new!(d, t, "Etc/UTC")
IO.inspect(DateTime.to_unix(dt))
IO.puts(DateTime.to_iso8601(dt))
IO.inspect(Calendar.strftime(dt, "%Y/%m/%d %H:%M"))
