(* Tarjan's strongly-connected-components algorithm over an
   adjacency-list graph represented as an int -> int list function. *)
fun tarjan_scc (adj, n) =
  let
    val index = Array.array (n, ~1)
    val lowlink = Array.array (n, ~1)
    val on_stack = Array.array (n, false)
    val counter = ref 0
    val stack = ref []
    val comps = ref []

    fun strong_connect v =
      let
        val () = Array.update (index, v, !counter)
        val () = Array.update (lowlink, v, !counter)
        val () = counter := !counter + 1
        val () = stack := v :: !stack
        val () = Array.update (on_stack, v, true)
        val () =
          List.app
            (fn w =>
              if Array.sub (index, w) = ~1 then
                (strong_connect w;
                 Array.update (lowlink, v, Int.min (Array.sub (lowlink, v), Array.sub (lowlink, w))))
              else if Array.sub (on_stack, w) then
                Array.update (lowlink, v, Int.min (Array.sub (lowlink, v), Array.sub (index, w)))
              else ())
            (adj v)
      in
        if Array.sub (lowlink, v) = Array.sub (index, v) then
          let
            fun pop_comp acc =
              case !stack of
                [] => acc
              | w :: rest =>
                  (stack := rest;
                   Array.update (on_stack, w, false);
                   if w = v then w :: acc
                   else pop_comp (w :: acc))
          in
            comps := pop_comp [] :: !comps
          end
        else ()
      end
  in
    List.app (fn v => if Array.sub (index, v) = ~1 then strong_connect v else ()) (List.tabulate (n, fn i => i));
    !comps
  end

val adj =
  fn 0 => [1]
   | 1 => [2]
   | 2 => [0, 3]
   | 3 => [4]
   | 4 => [5]
   | 5 => [3]
   | _ => []

val comps = tarjan_scc (adj, 6)
val () = app (fn c => print (String.concatWith "," (map Int.toString c) ^ "\n")) comps
