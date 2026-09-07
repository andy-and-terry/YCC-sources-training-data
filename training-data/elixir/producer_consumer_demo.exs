defmodule ProducerConsumerDemo do
  def run do
    consumer = spawn_link(fn -> consume() end)

    for n <- 1..5 do
      send(consumer, {:item, n})
    end

    send(consumer, :done)
    Process.sleep(50)
  end

  defp consume(total \\ 0) do
    receive do
      {:item, n} ->
        IO.puts("consumed #{n}")
        consume(total + n)

      :done ->
        IO.puts("total: #{total}")
    end
  end
end

ProducerConsumerDemo.run()
