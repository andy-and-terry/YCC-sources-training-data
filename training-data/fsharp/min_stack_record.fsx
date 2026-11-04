type MinStack<'a when 'a: comparison> = { Items: ('a * 'a) list }

module MinStack =
    let empty = { Items = [] }
    let push x s =
        let m = match s.Items with | [] -> x | (_, m) :: _ -> min x m
        { Items = (x, m) :: s.Items }
    let pop s = { Items = List.tail s.Items }
    let min s = s.Items |> List.head |> snd

let s = [ 5; 3; 7; 2 ] |> List.fold (fun acc x -> MinStack.push x acc) MinStack.empty
printfn "%d" (MinStack.min s)
printfn "%d" (MinStack.min (MinStack.pop s))
