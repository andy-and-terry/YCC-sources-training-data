function Show-Info {
    param([string]$Name, [int]$Age, [string]$City)
    "$Name is $Age years old and lives in $City"
}

$params = @{
    Name = "Bob"
    Age  = 25
    City = "Seattle"
}

Show-Info @params
