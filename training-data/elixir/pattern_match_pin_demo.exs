expected = 5

case 5 do
  ^expected -> IO.puts("matched pinned value")
  _ -> IO.puts("no match")
end

[head | tail] = [1, 2, 3]
IO.inspect({head, tail})

%{name: name} = %{name: "Ada", age: 36}
IO.puts(name)

{:ok, ^expected} = {:ok, 5}
IO.puts("pin in tuple ok")
