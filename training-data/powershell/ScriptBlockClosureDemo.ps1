function New-Counter {
    $count = 0
    { $script:count++; $count }.GetNewClosure()
}

function New-Multiplier([int]$Factor) {
    { param($x) $x * $Factor }.GetNewClosure()
}

$triple = New-Multiplier 3
& $triple 7
1..4 | ForEach-Object { & $triple $_ }

# a script block stored in a variable and invoked with arguments
$greet = { param($who, $greeting = "Hello") "$greeting, $who!" }
& $greet "Ada"
$greet.Invoke("Bob", "Hi")

# closures capture the value at creation time
$blocks = foreach ($i in 1..3) {
    $n = $i * 10
    { $n }.GetNewClosure()
}
$blocks | ForEach-Object { & $_ }

# higher-order function
function Apply-Twice([scriptblock]$Fn, $Value) { & $Fn (& $Fn $Value) }
Apply-Twice { param($v) $v + 5 } 1
