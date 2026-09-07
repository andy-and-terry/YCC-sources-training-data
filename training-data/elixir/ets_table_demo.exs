defmodule EtsTableDemo do
  def run do
    table = :ets.new(:scores, [:set, :private])

    :ets.insert(table, {:alice, 90})
    :ets.insert(table, {:bob, 85})
    :ets.insert(table, {:alice, 95})

    IO.inspect(:ets.lookup(table, :alice))
    IO.inspect(:ets.lookup(table, :carol))
    IO.inspect(:ets.info(table, :size))

    :ets.delete(table)
  end
end

EtsTableDemo.run()
