type p = { name : string; age : int }

let () =
  let a = { name = "Ann"; age = 30 } in
  let b = { a with age = 31 } in
  Printf.printf "%s %d %d\n" b.name a.age b.age
