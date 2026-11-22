// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
let isPractical (n: int) =
    // bit i set <=> i is a subset sum of the divisors
    let reach = [ 1 .. n ] |> List.fold (fun acc d -> if n % d = 0 then acc ||| (acc <<< d) else acc) 1UL
    let mask = (1UL <<< (n + 1)) - 1UL
    (reach &&& mask) = mask

[ 1 .. 40 ] |> List.filter isPractical |> List.map string |> String.concat " " |> printfn "%s"
