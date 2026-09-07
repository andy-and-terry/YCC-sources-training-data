let longestPalindrome (s: string) =
    let n = s.Length
    let mutable start = 0
    let mutable maxLen = 1
    let expand (l: int) (r: int) =
        let mutable left = l
        let mutable right = r
        while left >= 0 && right < n && s.[left] = s.[right] do
            left <- left - 1
            right <- right + 1
        (left + 1, right - left - 1)
    for i in 0 .. n - 1 do
        let (l1, len1) = expand i i
        if len1 > maxLen then
            start <- l1
            maxLen <- len1
        if i < n - 1 then
            let (l2, len2) = expand i (i + 1)
            if len2 > maxLen then
                start <- l2
                maxLen <- len2
    s.Substring(start, maxLen)

printfn "%s" (longestPalindrome "babad")
printfn "%s" (longestPalindrome "cbbd")
