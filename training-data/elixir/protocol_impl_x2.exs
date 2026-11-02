defprotocol Size do
  def size(x)
end

defimpl Size, for: BitString do
  def size(s), do: byte_size(s)
end

defimpl Size, for: List do
  def size(l), do: length(l)
end

IO.puts(Size.size("hello"))
IO.puts(Size.size([1, 2, 3]))
