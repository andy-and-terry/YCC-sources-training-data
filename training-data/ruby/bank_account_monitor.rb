require "monitor"

class BankAccount
  class InsufficientFunds < StandardError; end

  include MonitorMixin

  def initialize
    super()
    @balance = 0
  end

  def balance = synchronize { @balance }

  def deposit(amount)
    raise ArgumentError, "amount must be positive" unless amount.positive?

    synchronize { @balance += amount }
  end

  def withdraw(amount)
    synchronize do
      raise InsufficientFunds, "requested #{amount}, have #{@balance}" if amount > @balance

      @balance -= amount
    end
  end
end

acct = BankAccount.new
8.times.map { Thread.new { 1000.times { acct.deposit(1) } } }.each(&:join)
puts acct.balance
begin
  acct.withdraw(1_000_000)
rescue BankAccount::InsufficientFunds => e
  puts e.message
end
