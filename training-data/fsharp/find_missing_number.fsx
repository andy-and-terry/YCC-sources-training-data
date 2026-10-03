let findMissing (nums: int list) n =
    let expected = n * (n + 1) / 2
    let actual = List.sum nums
    expected - actual

printfn "%d" (findMissing [ 1; 2; 4; 5 ] 5)
