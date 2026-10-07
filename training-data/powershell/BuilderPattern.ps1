class Pizza {
    [string]$Size
    [string[]]$Toppings

    Pizza([string]$size, [string[]]$toppings) {
        $this.Size = $size
        $this.Toppings = $toppings
    }

    [string] Describe() {
        return "$($this.Size) pizza with toppings: $($this.Toppings -join ', ')"
    }
}

class PizzaBuilder {
    [string]$Size = 'medium'
    [System.Collections.Generic.List[string]]$Toppings = [System.Collections.Generic.List[string]]::new()

    [PizzaBuilder] SetSize([string]$size) {
        $this.Size = $size
        return $this
    }

    [PizzaBuilder] AddTopping([string]$topping) {
        $this.Toppings.Add($topping)
        return $this
    }

    [Pizza] Build() {
        return [Pizza]::new($this.Size, $this.Toppings.ToArray())
    }
}

$pizza = [PizzaBuilder]::new().SetSize('large').AddTopping('cheese').AddTopping('pepperoni').Build()
$pizza.Describe()
