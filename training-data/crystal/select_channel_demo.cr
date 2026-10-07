fast = Channel(String).new
slow = Channel(String).new

spawn do
  sleep 1.millisecond
  fast.send("fast result")
end

spawn do
  sleep 20.milliseconds
  slow.send("slow result")
end

select
when msg = fast.receive
  puts "got: #{msg}"
when msg = slow.receive
  puts "got: #{msg}"
end
