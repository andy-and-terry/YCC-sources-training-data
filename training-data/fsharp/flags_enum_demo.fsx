open System

[<Flags>]
type Permission =
    | None = 0
    | Read = 1
    | Write = 2
    | Execute = 4

let perms = Permission.Read ||| Permission.Write

printfn "%A" perms
printfn "can read: %b" (perms.HasFlag Permission.Read)
printfn "can execute: %b" (perms.HasFlag Permission.Execute)
printfn "toggled: %A" (perms ^^^ Permission.Write)
printfn "raw value: %d" (int perms)
printfn "parsed: %A" (Enum.Parse(typeof<Permission>, "Read, Execute") :?> Permission)
