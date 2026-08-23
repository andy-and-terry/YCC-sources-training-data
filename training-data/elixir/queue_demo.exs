defmodule QueueDemo do
  def run do
    q = :queue.new()
    q = :queue.in(1, q)
    q = :queue.in(2, q)
    q = :queue.in(3, q)

    {{:value, front}, q} = :queue.out(q)
    IO.inspect(front)
    IO.inspect(:queue.to_list(q))
  end
end

QueueDemo.run()
