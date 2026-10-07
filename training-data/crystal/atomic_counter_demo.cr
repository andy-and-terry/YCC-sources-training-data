# Lock-free counter using Atomic across fibers.
counter = Atomic(Int32).new(0)
done = Channel(Nil).new
workers = 5

workers.times do
  spawn do
    1000.times { counter.add(1) }
    done.send(nil)
  end
end

workers.times { done.receive }
puts counter.get
