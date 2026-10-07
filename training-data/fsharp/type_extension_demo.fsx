type System.String with
    member this.IsPalindrome =
        let cleaned = this.ToLower()
        cleaned = System.String(Array.rev (cleaned.ToCharArray()))

type System.Int32 with
    member this.IsEven = this % 2 = 0

printfn "%b" ("racecar".IsPalindrome)
printfn "%b" ("hello".IsPalindrome)
printfn "%b" (4).IsEven
printfn "%b" (5).IsEven
