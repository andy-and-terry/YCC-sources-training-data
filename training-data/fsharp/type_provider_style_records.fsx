type Person =
    { Name: string
      Age: int }

let birthday person = { person with Age = person.Age + 1 }

let alice = { Name = "Alice"; Age = 30 }
let older = birthday alice
printfn "%A" older
