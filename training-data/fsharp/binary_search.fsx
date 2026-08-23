let rec binarySearch (arr: int[]) low high target =
    if low > high then -1
    else
        let mid = (low + high) / 2
        if arr.[mid] = target then mid
        elif arr.[mid] < target then binarySearch arr (mid + 1) high target
        else binarySearch arr low (mid - 1) target

let data = [| 1; 3; 5; 7; 9; 11 |]
printfn "%d" (binarySearch data 0 (data.Length - 1) 7)
