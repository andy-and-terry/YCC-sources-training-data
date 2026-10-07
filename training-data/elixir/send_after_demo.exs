defmodule Reminder do
  def run do
    parent = self()

    Process.send_after(parent, {:remind, "stretch"}, 30)
    Process.send_after(parent, {:remind, "drink water"}, 10)
    timer = Process.send_after(parent, {:remind, "cancelled"}, 20)

    remaining = Process.cancel_timer(timer)
    IO.puts("cancelled timer had #{inspect(is_integer(remaining))} time left")

    collect(2)
  end

  defp collect(0), do: IO.puts("all reminders received")

  defp collect(n) do
    receive do
      {:remind, text} ->
        IO.puts("reminder: #{text}")
        collect(n - 1)
    after
      500 -> IO.puts("timed out")
    end
  end
end

Reminder.run()
