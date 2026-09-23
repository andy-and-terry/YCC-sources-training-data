type Student = { Name: string; Grade: string; Score: float }

let students =
    [ { Name = "Alice"; Grade = "A"; Score = 91.0 }
      { Name = "Bob"; Grade = "B"; Score = 78.0 }
      { Name = "Carol"; Grade = "A"; Score = 95.0 }
      { Name = "Dave"; Grade = "B"; Score = 82.0 }
      { Name = "Eve"; Grade = "C"; Score = 65.0 } ]

students
|> List.groupBy (fun s -> s.Grade)
|> List.map (fun (grade, group) -> grade, group |> List.averageBy (fun s -> s.Score))
|> List.sortByDescending snd
|> List.iter (fun (grade, avg) -> printfn "%s: avg score %.2f" grade avg)

students
|> List.sortByDescending (fun s -> s.Score)
|> List.truncate 2
|> List.map (fun s -> s.Name)
|> printfn "top scorers: %A"
