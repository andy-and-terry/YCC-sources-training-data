type person = { name : string; mutable age : int; email : string option }

let birthday p = p.age <- p.age + 1

let () =
  let p = { name = "Ada"; age = 36; email = None } in
  birthday p;
  let q = { p with email = Some "ada@x.org" } in
  Printf.printf "%s %d %s\n" q.name q.age (match q.email with Some e -> e | None -> "-");
  let { name; age; _ } = q in
  Printf.printf "%s/%d\n" name age
