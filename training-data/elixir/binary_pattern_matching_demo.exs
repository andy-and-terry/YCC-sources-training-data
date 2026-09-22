defmodule BinaryPatternMatching do
  # Parse a minimal fixed-layout header: 1-byte version, 2-byte big-endian
  # length, followed by `length` bytes of payload.
  def parse_header(<<version::8, length::16, payload::binary-size(length), rest::binary>>) do
    {:ok, %{version: version, length: length, payload: payload}, rest}
  end

  def parse_header(_other), do: {:error, :malformed}

  # Split an IPv4 address packed into 4 bytes back into its dotted parts.
  def ipv4_octets(<<a::8, b::8, c::8, d::8>>) do
    {a, b, c, d}
  end

  # Count set bits in a bitstring by matching one bit at a time.
  def count_set_bits(bits), do: do_count_set_bits(bits, 0)

  defp do_count_set_bits(<<>>, acc), do: acc
  defp do_count_set_bits(<<1::1, rest::bitstring>>, acc), do: do_count_set_bits(rest, acc + 1)
  defp do_count_set_bits(<<0::1, rest::bitstring>>, acc), do: do_count_set_bits(rest, acc)
end

packet = <<1::8, 5::16, "hello", "extra">>
IO.inspect(BinaryPatternMatching.parse_header(packet))

IO.inspect(BinaryPatternMatching.ipv4_octets(<<192, 168, 0, 1>>))

IO.inspect(BinaryPatternMatching.count_set_bits(<<0b1011_0110>>))
