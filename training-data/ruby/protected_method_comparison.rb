class Account
  def initialize(balance)
    @balance = balance
  end

  def richer_than?(other)
    balance > other.balance
  end

  protected

  def balance
    @balance
  end
end

a = Account.new(100)
b = Account.new(50)
puts a.richer_than?(b)
puts b.richer_than?(a)

begin
  a.balance
rescue NoMethodError => e
  puts e.message.sub(/ for .*/, "")
end

puts Account.protected_instance_methods.inspect
puts a.respond_to?(:balance)
puts a.respond_to?(:balance, true)
