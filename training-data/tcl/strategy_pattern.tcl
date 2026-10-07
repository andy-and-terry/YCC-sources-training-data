oo::class create PaymentContext {
    variable strategy

    method setStrategy {s} {
        set strategy $s
    }

    method checkout {amount} {
        return [$strategy pay $amount]
    }
}

oo::class create CreditCardStrategy {
    method pay {amount} {
        return "Paid \$$amount via credit card"
    }
}

oo::class create PayPalStrategy {
    method pay {amount} {
        return "Paid \$$amount via PayPal"
    }
}

set context [PaymentContext new]
set creditCard [CreditCardStrategy new]
set payPal [PayPalStrategy new]

$context setStrategy $creditCard
puts [$context checkout 42]

$context setStrategy $payPal
puts [$context checkout 17]

$context destroy
$creditCard destroy
$payPal destroy
