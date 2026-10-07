csv = "alice,30,paris;bob,25,rome;carol,41,oslo"

rows =
  csv
  |> String.split(";")
  |> Enum.map(&String.split(&1, ","))

IO.inspect(rows)

people =
  Enum.map(rows, fn [name, age, city] ->
    %{name: String.capitalize(name), age: String.to_integer(age), city: city}
  end)

IO.inspect(people)
IO.puts(Enum.map_join(people, " | ", & &1.name))
IO.inspect(String.split("a  b   c", " ", trim: true))
IO.inspect(String.split("2024-05-17", "-", parts: 2))
IO.inspect(String.split("one1two22three", ~r/\d+/))
IO.inspect(Enum.join([1, 2, 3], "+"))
IO.inspect("hello world" |> String.split() |> Enum.map(&String.reverse/1))
