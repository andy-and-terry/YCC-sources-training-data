class InsufficientFunds < StandardError; end

class Account
  attr_reader :id, :lock

  def initialize(id, balance)
    @id = id
    @balance = balance
    @lock = Mutex.new
  end

  def balance = @lock.synchronize { @balance }

  def withdraw!(amount)
    raise InsufficientFunds, "account #{id}: #{@balance} < #{amount}" if @balance < amount

    @balance -= amount
  end

  def deposit!(amount) = @balance += amount
end

# Lock ordering by id prevents deadlock when two threads transfer in opposite directions.
def transfer(from, to, amount)
  return if from.equal?(to)

  first, second = [from, to].sort_by(&:id)
  first.lock.synchronize do
    second.lock.synchronize do
      from.withdraw!(amount)
      to.deposit!(amount)
    end
  end
end

accounts = Array.new(5) { |i| Account.new(i, 1000) }
rejected = Queue.new
threads = Array.new(8) do |t|
  Thread.new do
    rng = Random.new(t)
    5000.times do
      transfer(accounts.sample(random: rng), accounts.sample(random: rng), rng.rand(100))
    rescue InsufficientFunds
      rejected << 1
    end
  end
end
threads.each(&:join)
puts "total #{accounts.sum(&:balance)} (expected 5000), rejected #{rejected.size}"
