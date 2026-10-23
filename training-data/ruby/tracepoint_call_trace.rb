def add(a, b)
  a + b
end

def double_sum(a, b)
  add(a, b) * 2
end

events = []
trace = TracePoint.new(:call, :return) do |tp|
  if tp.event == :call
    events << "call #{tp.method_id}"
  else
    events << "return #{tp.method_id} => #{tp.return_value}"
  end
end

trace.enable
double_sum(1, 2)
trace.disable

puts events
puts trace.enabled?

# enable with a block turns the trace on only for that block
count = 0
TracePoint.new(:call) { count += 1 }.enable { add(1, 1); add(2, 2) }
puts count
