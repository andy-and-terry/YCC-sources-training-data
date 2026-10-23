open System

type Printer =
    static member Join(sep: string, [<ParamArray>] items: string[]) =
        String.Join(sep, items)

printfn "%s" (Printer.Join(", ", "red", "green", "blue"))
printfn "%s" (Printer.Join("-", "one"))
printfn "%s" (Printer.Join("/"))
