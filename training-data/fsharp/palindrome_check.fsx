let isPalindrome (s: string) =
    let normalized =
        s.ToLower()
        |> Seq.filter System.Char.IsLetterOrDigit
        |> Array.ofSeq
    let reversed = Array.rev normalized
    normalized = reversed

printfn "%b" (isPalindrome "A man, a plan, a canal: Panama")
printfn "%b" (isPalindrome "hello")
