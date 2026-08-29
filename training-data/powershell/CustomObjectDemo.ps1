$person = [PSCustomObject]@{
    Name = "Alice"
    Age  = 30
}

$person | Add-Member -MemberType ScriptMethod -Name Greet -Value {
    "Hello, $($this.Name)!"
}

$person.Greet()
