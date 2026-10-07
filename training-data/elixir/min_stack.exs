defmodule MinStack do
  defstruct stack: [], min_stack: []

  def new, do: %MinStack{}

  def push(%MinStack{stack: stack, min_stack: min_stack}, value) do
    new_min_stack =
      case min_stack do
        [top | _] when top < value -> min_stack
        _ -> [value | min_stack]
      end

    %MinStack{stack: [value | stack], min_stack: new_min_stack}
  end

  def min(%MinStack{min_stack: [top | _]}), do: top
end

stack = MinStack.new()
stack = MinStack.push(stack, 5)
stack = MinStack.push(stack, 2)
stack = MinStack.push(stack, 7)
IO.puts(MinStack.min(stack))
