class Pizza {
    [string]$Size
    [string[]]$Toppings

    Pizza([string]$size, [string[]]$toppings) {
        $this.Size = $size
        $this.Toppings = $toppings
    }

    [string] Describe() {
        $toppingList = if ($this.Toppings.Count -gt 0) { $this.Toppings -join ', ' } else { 'none' }
        return "$($this.Size) pizza with toppings: $toppingList"
    }
}

class PizzaBuilder {
    hidden [string]$size = 'medium'
    hidden [System.Collections.Generic.List[string]]$toppings = [System.Collections.Generic.List[string]]::new()

    [PizzaBuilder] WithSize([string]$size) {
        $this.size = $size
        return $this
    }

    [PizzaBuilder] AddTopping([string]$topping) {
        $this.toppings.Add($topping)
        return $this
    }

    [Pizza] Build() {
        return [Pizza]::new($this.size, $this.toppings.ToArray())
    }
}

$pizza = [PizzaBuilder]::new().WithSize('large').AddTopping('mozzarella').AddTopping('basil').Build()
$pizza.Describe()
