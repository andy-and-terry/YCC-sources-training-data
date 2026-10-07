defmodule DequeDemo do
  def run do
    deque = :queue.new()
    deque = :queue.in(1, deque)
    deque = :queue.in(2, deque)
    deque = :queue.in_r(0, deque)

    IO.inspect(:queue.to_list(deque))

    {{:value, front}, deque} = :queue.out(deque)
    IO.puts(front)

    {{:value, back}, deque} = :queue.out_r(deque)
    IO.puts(back)

    IO.inspect(:queue.to_list(deque))
  end
end

DequeDemo.run()
