enum Level { Low = 1; Mid = 5; High = 10 }

class Animal {
    [string]$Name
    hidden [int]$Secret = 42
    static [int]$Count = 0
    Animal([string]$name) { $this.Name = $name; [Animal]::Count++ }
    [string] Speak() { return "$($this.Name) makes a sound" }
}

class Dog : Animal {
    [string[]]$Tricks = @()
    Dog([string]$name) : base($name) {}
    [string] Speak() { return "$($this.Name) barks" }
    [void] Learn([string]$t) { $this.Tricks += $t }
}

$d = [Dog]::new('Rex')
$d.Learn('sit'); $d.Learn('roll')
$d.Speak(); $d.Tricks -join ','; [Animal]::Count
([Animal]::new('Gen')).Speak()
[Level]::High; [int][Level]::Mid; [Level]'Low'; [Enum]::GetNames([Level]) -join ','
$d -is [Animal]; $d.GetType().BaseType.Name
