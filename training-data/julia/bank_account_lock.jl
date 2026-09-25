struct InsufficientFunds <: Exception
    requested::Int
    available::Int
end

mutable struct Account
    balance::Int
    lock::ReentrantLock
    Account(b = 0) = new(b, ReentrantLock())
end

deposit!(a::Account, n::Int) = lock(() -> (a.balance += n), a.lock)

function withdraw!(a::Account, n::Int)
    lock(a.lock) do
        n > a.balance && throw(InsufficientFunds(n, a.balance))
        a.balance -= n
    end
end

acct = Account()
@sync for _ in 1:8
    Threads.@spawn for _ in 1:1000
        deposit!(acct, 1)
    end
end
println(acct.balance)
try
    withdraw!(acct, 1_000_000)
catch e
    println(e)
end
