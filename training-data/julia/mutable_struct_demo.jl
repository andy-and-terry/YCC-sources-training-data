mutable struct Account
    owner::String
    balance::Float64
    history::Vector{String}
end

Account(owner) = Account(owner, 0.0, String[])

function deposit!(a::Account, amount)
    amount > 0 || throw(ArgumentError("amount must be positive"))
    a.balance += amount
    push!(a.history, "deposit $amount")
    return a
end

function withdraw!(a::Account, amount)
    amount <= a.balance || error("insufficient funds")
    a.balance -= amount
    push!(a.history, "withdraw $amount")
    return a
end

acct = Account("Ada")
deposit!(acct, 100)
withdraw!(acct, 30.5)
println(acct.balance)
println(acct.history)

try
    withdraw!(acct, 1000)
catch e
    println(e.msg)
end

alias = acct
alias.balance = 0
println(acct.balance)

println(isimmutable(acct), isimmutable((1, 2)))
println(fieldnames(Account))
println(ismutable(acct))
copy_acct = deepcopy(acct)
copy_acct.owner = "Bob"
println(acct.owner, " ", copy_acct.owner)
