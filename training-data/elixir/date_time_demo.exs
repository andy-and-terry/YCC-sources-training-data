d = ~D[2024-02-28]
IO.inspect(Date.add(d, 2))
IO.inspect(Date.day_of_week(d))
IO.inspect(Date.leap_year?(d))
IO.inspect(Date.days_in_month(d))
IO.inspect(Date.diff(~D[2024-12-25], d))
IO.inspect(Date.compare(d, ~D[2025-01-01]))
IO.inspect(Date.range(d, ~D[2024-03-02]) |> Enum.map(&to_string/1))

t = ~T[13:45:10]
IO.inspect(Time.add(t, 3600))
IO.inspect(Time.to_string(t))

{:ok, dt, _} = DateTime.from_iso8601("2024-03-15T10:20:30Z")
IO.inspect(DateTime.to_unix(dt))
IO.inspect(DateTime.add(dt, 86_400, :second) |> DateTime.to_iso8601())

IO.inspect(NaiveDateTime.diff(~N[2024-01-02 00:00:00], ~N[2024-01-01 00:00:00]))
