// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
let rec gcd a b = if b = 0 then a else gcd b (a % b)

let phi n = [ 1 .. n ] |> List.filter (fun k -> gcd k n = 1) |> List.length

let rec chainSum m = if m <= 1 then 0 else phi m + chainSum (phi m)

[ 2 .. 199 ] |> List.filter (fun n -> chainSum n = n) |> List.map string |> String.concat " " |> printfn "%s"
