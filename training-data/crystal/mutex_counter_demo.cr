mutex = Mutex.new
counter = 0
done = Channel(Nil).new

5.times do
  spawn do
    100.times do
      mutex.synchronize { counter += 1 }
    end
    done.send(nil)
  end
end

5.times { done.receive }
puts counter
