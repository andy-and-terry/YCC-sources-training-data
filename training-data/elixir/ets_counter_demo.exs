table = :ets.new(:counters, [:set, :public])

for word <- ~w(a b a c a b) do
  :ets.update_counter(table, word, 1, {word, 0})
end

IO.inspect(Enum.sort(:ets.tab2list(table)))
IO.inspect(:ets.lookup(table, "a"))
IO.inspect(:ets.member(table, "z"))
IO.inspect(:ets.info(table, :size))
:ets.delete(table, "a")
IO.inspect(:ets.select(table, [{{:"$1", :"$2"}, [{:>, :"$2", 1}], [:"$1"]}]))
:ets.delete(table)
