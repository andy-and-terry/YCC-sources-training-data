abstract type DiscountStrategy end

struct NoDiscount <: DiscountStrategy end
struct TenPercentOff <: DiscountStrategy end
struct HalfOff <: DiscountStrategy end

apply_discount(::NoDiscount, price::Float64) = price
apply_discount(::TenPercentOff, price::Float64) = price * 0.9
apply_discount(::HalfOff, price::Float64) = price * 0.5

function checkout(price::Float64, strategy::DiscountStrategy)
    return apply_discount(strategy, price)
end

println(checkout(200.0, NoDiscount()))
println(checkout(200.0, TenPercentOff()))
println(checkout(200.0, HalfOff()))
