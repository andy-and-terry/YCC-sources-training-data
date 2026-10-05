open System

[<Flags>]
type Permissions =
    | None = 0
    | Read = 1
    | Write = 2
    | Execute = 4

let perms = Permissions.Read ||| Permissions.Write
printfn "%A" perms
printfn "%b" (perms.HasFlag Permissions.Write)
printfn "%b" ((perms &&& Permissions.Execute) = Permissions.None)

let withExec = perms ||| Permissions.Execute
printfn "%d" (int withExec)
printfn "%A" (withExec &&& ~~~Permissions.Read)

let parsed = Enum.Parse(typeof<Permissions>, "Read, Execute") :?> Permissions
printfn "%A" parsed
