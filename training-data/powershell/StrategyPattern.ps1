class NoDiscount {
    [double] Apply([double]$amount) {
        return $amount
    }
}

class PercentageDiscount {
    [double]$Percent

    PercentageDiscount([double]$percent) {
        $this.Percent = $percent
    }

    [double] Apply([double]$amount) {
        return $amount * (1 - $this.Percent / 100)
    }
}

class FlatDiscount {
    [double]$Flat

    FlatDiscount([double]$flat) {
        $this.Flat = $flat
    }

    [double] Apply([double]$amount) {
        return [Math]::Max(0, $amount - $this.Flat)
    }
}

class Checkout {
    $Strategy

    Checkout($strategy) {
        $this.Strategy = $strategy
    }

    [double] Total([double]$amount) {
        return $this.Strategy.Apply($amount)
    }
}

$checkouts = @(
    [Checkout]::new([NoDiscount]::new())
    [Checkout]::new([PercentageDiscount]::new(10))
    [Checkout]::new([FlatDiscount]::new(5))
)

foreach ($checkout in $checkouts) {
    $checkout.Total(100)
}
