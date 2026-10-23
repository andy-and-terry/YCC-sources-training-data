data = "Hello, Elixir!"

b64 = Base.encode64(data)
IO.puts(b64)
IO.puts(Base.decode64!(b64))

IO.puts(Base.url_encode64(<<251, 255, 254>>, padding: false))
IO.puts(Base.encode16(data, case: :lower))
IO.inspect(Base.decode16!("48656C6C6F"))
IO.puts(Base.encode32(data))
IO.inspect(Base.decode64("not base64!"))
