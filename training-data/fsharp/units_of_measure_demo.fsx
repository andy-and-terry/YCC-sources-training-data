[<Measure>] type m
[<Measure>] type s

let speed (distance: float<m>) (time: float<s>) : float<m/s> =
    distance / time

printfn "%f" (speed 100.0<m> 9.58<s>)
printfn "%f" (speed 200.0<m> 19.30<s>)
