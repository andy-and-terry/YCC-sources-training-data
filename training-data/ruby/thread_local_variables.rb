Thread.current[:request_id] = "main"

threads = 3.times.map do |i|
  Thread.new(i) do |n|
    Thread.current[:request_id] = "req-#{n}"
    Thread.current.thread_variable_set(:tv, n * 10)
    sleep 0.01
    [Thread.current[:request_id], Thread.current.thread_variable_get(:tv)]
  end
end

p threads.map(&:value)
puts Thread.current[:request_id]
