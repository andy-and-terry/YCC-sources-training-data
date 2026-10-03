type Handler = int -> string

let makeHandler (canHandle: int -> bool) (handle: int -> string) (next: Handler) : Handler =
    fun request ->
        if canHandle request then handle request
        else next request

let unhandled: Handler = fun request -> sprintf "No handler for severity %d" request

let highHandler =
    makeHandler (fun s -> s >= 3) (fun s -> sprintf "Manager handles severity %d" s) unhandled

let mediumHandler =
    makeHandler (fun s -> s = 2) (fun s -> sprintf "Supervisor handles severity %d" s) highHandler

let lowHandler =
    makeHandler (fun s -> s = 1) (fun s -> sprintf "Agent handles severity %d" s) mediumHandler

[ 1; 2; 3; 5 ] |> List.iter (fun s -> printfn "%s" (lowHandler s))
