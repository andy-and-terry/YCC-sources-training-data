class SimpleCoffee {
    [double] Cost() { return 2.0 }
    [string] Description() { return "Coffee" }
}

class MilkDecorator {
    $Coffee

    MilkDecorator($coffee) {
        $this.Coffee = $coffee
    }

    [double] Cost() { return $this.Coffee.Cost() + 0.5 }
    [string] Description() { return "$($this.Coffee.Description()) + Milk" }
}

class SugarDecorator {
    $Coffee

    SugarDecorator($coffee) {
        $this.Coffee = $coffee
    }

    [double] Cost() { return $this.Coffee.Cost() + 0.25 }
    [string] Description() { return "$($this.Coffee.Description()) + Sugar" }
}

$order = [SugarDecorator]::new([MilkDecorator]::new([SimpleCoffee]::new()))
"$($order.Description()): `$$($order.Cost())"
