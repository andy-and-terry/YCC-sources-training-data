exception Insufficient_funds of float

type account = { owner : string; mutable balance : float }

let open_account owner initial = { owner; balance = initial }

let deposit account amount = account.balance <- account.balance +. amount

let withdraw account amount =
  if amount > account.balance then raise (Insufficient_funds (amount -. account.balance))
  else account.balance <- account.balance -. amount

let () =
  let acc = open_account "Alice" 100.0 in
  deposit acc 50.0;
  Printf.printf "%s balance: %.2f\n" acc.owner acc.balance;
  (try withdraw acc 500.0
   with Insufficient_funds shortfall -> Printf.printf "declined, short by %.2f\n" shortfall);
  withdraw acc 30.0;
  Printf.printf "%s balance: %.2f\n" acc.owner acc.balance
