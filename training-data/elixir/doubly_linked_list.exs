defmodule DoublyLinkedList do
  defstruct front: [], back: []

  def new, do: %__MODULE__{}

  def push_back(%__MODULE__{front: front, back: back}, value) do
    %__MODULE__{front: front, back: [value | back]}
  end

  def push_front(%__MODULE__{front: front, back: back}, value) do
    %__MODULE__{front: [value | front], back: back}
  end

  def to_list(%__MODULE__{front: front, back: back}) do
    Enum.reverse(front) ++ Enum.reverse(back)
  end
end

list =
  DoublyLinkedList.new()
  |> DoublyLinkedList.push_back(2)
  |> DoublyLinkedList.push_back(3)
  |> DoublyLinkedList.push_front(1)

IO.inspect(DoublyLinkedList.to_list(list))
