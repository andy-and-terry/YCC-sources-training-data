class Account
  property owner : String
  getter balance : Float64
  setter note : String?
  property? active : Bool = true

  def initialize(@owner : String, @balance : Float64 = 0.0)
    @note = nil
  end

  def deposit(amount : Float64)
    @balance += amount
  end

  def note : String
    @note || "no note"
  end
end

acct = Account.new("Ana", 10.0)
acct.deposit(5.5)
acct.owner = "Ana B."
puts acct.owner
puts acct.balance
puts acct.note
acct.note = "vip"
puts acct.note
puts acct.active?
