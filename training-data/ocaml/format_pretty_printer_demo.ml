type expr = Num of int | Add of expr * expr | Mul of expr * expr | Neg of expr

let rec pp fmt = function
  | Num n -> Format.fprintf fmt "%d" n
  | Neg e -> Format.fprintf fmt "-%a" pp_atom e
  | Add (a, b) -> Format.fprintf fmt "%a + %a" pp a pp b
  | Mul (a, b) -> Format.fprintf fmt "%a * %a" pp_mul a pp_mul b

and pp_mul fmt = function
  | Add _ as e -> Format.fprintf fmt "(%a)" pp e
  | e -> pp fmt e

and pp_atom fmt = function
  | Num _ as e -> pp fmt e
  | e -> Format.fprintf fmt "(%a)" pp e

let pp_list pp_item fmt items =
  Format.fprintf fmt "[@[<hov>%a@]]"
    (Format.pp_print_list ~pp_sep:(fun f () -> Format.fprintf f ";@ ") pp_item)
    items

let () =
  let e = Mul (Add (Num 1, Num 2), Neg (Add (Num 3, Num 4))) in
  Format.printf "%a@." pp e;
  Format.printf "%a@." (pp_list Format.pp_print_int) [ 1; 2; 3; 4 ];
  Format.printf "%s has %d chars@." "pretty" (String.length "pretty")
