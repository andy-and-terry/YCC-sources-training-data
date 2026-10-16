class Account
  attr_reader :owner
  attr_writer :nickname
  attr_accessor :balance

  def initialize(owner, balance)
    @owner = owner
    @balance = balance
  end

  def nickname = @nickname || owner

  def transfer_to(other, amt)
    other.credit(amt) if debit(amt)
  end

  protected

  def credit(amt) = self.balance += amt

  private

  def debit(amt)
    return false if amt > balance
    self.balance -= amt
    true
  end
end

a = Account.new("ann", 100)
b = Account.new("bob", 0)
a.transfer_to(b, 40)
puts a.balance, b.balance, a.nickname
begin
  a.debit(1)
rescue NoMethodError => e
  puts e.message[0, 40]
end
begin
  a.credit(1)
rescue NoMethodError => e
  puts e.message[0, 40]
end
puts Account.private_instance_methods(false).inspect
