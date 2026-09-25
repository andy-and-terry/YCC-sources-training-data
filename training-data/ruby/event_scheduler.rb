class Simulator
  attr_reader :now

  def initialize
    @now = 0.0
    @seq = 0
    @queue = [] # kept sorted by [time, seq]
  end

  def after(delay, label, &action)
    event = [@now + delay, @seq += 1, label, action]
    idx = @queue.bsearch_index { |e| (e[0] <=> event[0]).nonzero? ? e[0] > event[0] : e[1] > event[1] } || @queue.size
    @queue.insert(idx, event)
  end

  def run
    until @queue.empty?
      @now, _, label, action = @queue.shift
      puts format('t=%4.1f %s', @now, label)
      action&.call
    end
  end
end

sim = Simulator.new
server_free = 0.0
[[0, 3], [1, 2], [1.5, 4], [6, 1]].each_with_index do |(arrive, service), i|
  sim.after(arrive, "c#{i} arrives") do
    start = [sim.now, server_free].max
    server_free = start + service
    sim.after(server_free - sim.now, "c#{i} leaves (waited #{start - arrive})")
  end
end
sim.run
