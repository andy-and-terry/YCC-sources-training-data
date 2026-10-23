// Query expressions give LINQ-style queries over in-memory sequences.
type Person = { Name: string; Age: int; City: string }

let people =
    [ { Name = "Ann"; Age = 31; City = "Oslo" }
      { Name = "Bob"; Age = 25; City = "Rome" }
      { Name = "Cy"; Age = 42; City = "Oslo" }
      { Name = "Di"; Age = 19; City = "Rome" } ]

let adults =
    query {
        for p in people do
        where (p.Age >= 21)
        sortByDescending p.Age
        select p.Name
    }
printfn "%A" (Seq.toList adults)

let byCity =
    query {
        for p in people do
        groupBy p.City into g
        select (g.Key, g.Count())
    }
printfn "%A" (Seq.toList byCity)

let oldest = query { for p in people do maxBy p.Age }
printfn "%d" oldest
printfn "%b" (query { for p in people do exists (p.City = "Rome") })
