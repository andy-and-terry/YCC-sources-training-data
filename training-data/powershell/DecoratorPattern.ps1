class Coffee {
    [double] Cost() { return 2.0 }
    [string] Description() { return "coffee" }
}

class MilkDecorator {
    [object]$Wrapped
    MilkDecorator([object]$wrapped) { $this.Wrapped = $wrapped }
    [double] Cost() { return $this.Wrapped.Cost() + 0.5 }
    [string] Description() { return "$($this.Wrapped.Description()) + milk" }
}

class SugarDecorator {
    [object]$Wrapped
    SugarDecorator([object]$wrapped) { $this.Wrapped = $wrapped }
    [double] Cost() { return $this.Wrapped.Cost() + 0.25 }
    [string] Description() { return "$($this.Wrapped.Description()) + sugar" }
}

$drink = [Coffee]::new()
$drink = [MilkDecorator]::new($drink)
$drink = [SugarDecorator]::new($drink)

"{0}: `${1:N2}" -f $drink.Description(), $drink.Cost()
