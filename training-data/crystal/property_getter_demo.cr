class Account
  getter owner : String
  getter balance : Float64 = 0.0
  property? active : Bool = true
  setter nickname : String?

  def initialize(@owner : String)
  end

  def deposit(amount : Float64)
    raise ArgumentError.new("amount must be positive") unless amount > 0
    @balance += amount
    self
  end

  def nickname : String
    @nickname || @owner
  end
end

acct = Account.new("Ada")
acct.deposit(50.0).deposit(25.5)
puts acct.balance
puts acct.nickname
acct.nickname = "A."
puts acct.nickname
puts acct.active?
acct.active = false
puts acct.active?
