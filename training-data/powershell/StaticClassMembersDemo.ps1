class IdGenerator {
    static [int] $Next = 1
    static [string] $Prefix = 'ID'

    static [string] New() {
        $id = '{0}-{1:D4}' -f [IdGenerator]::Prefix, [IdGenerator]::Next
        [IdGenerator]::Next++
        return $id
    }

    static [void] Reset() {
        [IdGenerator]::Next = 1
    }
}

[IdGenerator]::New()
[IdGenerator]::New()
[IdGenerator]::Prefix = 'ORD'
[IdGenerator]::New()
[IdGenerator]::Reset()
[IdGenerator]::New()
