require 'monitor'

class Account
  include MonitorMixin

  attr_reader :balance

  def initialize(balance)
    super()
    @balance = balance
  end

  def deposit(n)
    synchronize { @balance += n }
  end

  # Re-enters the same monitor; a plain Mutex would deadlock here.
  def deposit_twice(n)
    synchronize do
      deposit(n)
      deposit(n)
    end
  end
end

acct = Account.new(100)
10.times.map { Thread.new { acct.deposit_twice(1) } }.each(&:join)
puts acct.balance # 120
