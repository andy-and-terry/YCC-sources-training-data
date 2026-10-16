open System

let maxOf<'T when 'T : comparison> (xs: 'T list) = List.reduce max xs

printfn "%d" (maxOf [ 3; 9; 4 ])
printfn "%s" (maxOf [ "pear"; "apple"; "zebra" ])

let describe<'T when 'T :> IComparable<'T>> (a: 'T) (b: 'T) =
    match a.CompareTo b with
    | 0 -> "equal"
    | n when n < 0 -> "less"
    | _ -> "greater"

printfn "%s" (describe 1 2)
printfn "%s" (describe "b" "a")

let makeDefault<'T when 'T : (new : unit -> 'T)> () = new 'T()
printfn "%A" (makeDefault<System.Text.StringBuilder>().Length)

let isNull' (x: 'T when 'T : null) = obj.ReferenceEquals(x, null)
printfn "%b %b" (isNull' (null: string)) (isNull' "x")
