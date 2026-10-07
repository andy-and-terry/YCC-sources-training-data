mutable struct Subject
    observers::Vector{Function}
    price::Float64
    Subject() = new(Function[], 0.0)
end

function subscribe!(subject::Subject, observer::Function)
    push!(subject.observers, observer)
end

function set_price!(subject::Subject, price::Float64)
    subject.price = price
    for observer in subject.observers
        observer(price)
    end
end

subject = Subject()
subscribe!(subject, p -> println("Observer A: price is now $p"))
subscribe!(subject, p -> println("Observer B: logging price $p"))

set_price!(subject, 10.5)
set_price!(subject, 12.25)
