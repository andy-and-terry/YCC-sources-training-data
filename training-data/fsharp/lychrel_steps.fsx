// Reverse-and-add until a palindrome; count the steps.
let rev (n: bigint) =
    bigint.Parse(System.String(Array.rev ((string n).ToCharArray())))

let steps (start: int) =
    let rec go n count =
        if count > 0 && n = rev n then count
        elif count >= 100 then -1
        else go (n + rev n) (count + 1)
    go (bigint start) 0

[ 56; 57; 59; 79; 89 ] |> List.map (steps >> string) |> String.concat " " |> printfn "%s"
