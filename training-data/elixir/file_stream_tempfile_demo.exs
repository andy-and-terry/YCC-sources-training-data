# File.stream!/1 reads lazily line by line, so large files stay cheap.
path = Path.join(System.tmp_dir!(), "file_stream_demo_#{System.unique_integer([:positive])}.txt")

File.write!(path, "alpha\nbeta\n\ngamma\ndelta\n")

lines =
  path
  |> File.stream!()
  |> Stream.map(&String.trim/1)
  |> Stream.reject(&(&1 == ""))
  |> Enum.to_list()

IO.inspect(lines)

# Lazy pipeline: only the first two lines are read
first_two =
  path
  |> File.stream!()
  |> Stream.map(&String.upcase/1)
  |> Enum.take(2)

IO.inspect(first_two)

# Writing through a stream with Enum.into
out = path <> ".out"
1..3
|> Stream.map(&"line #{&1}\n")
|> Enum.into(File.stream!(out))

IO.puts(File.read!(out))

# Append mode
File.write!(out, "line 4\n", [:append])
IO.inspect(File.stream!(out) |> Enum.count())

File.rm!(path)
File.rm!(out)
IO.inspect(File.exists?(path))
