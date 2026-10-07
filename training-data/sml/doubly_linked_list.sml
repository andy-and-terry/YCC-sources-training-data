datatype 'a dnode = DNode of { value: 'a, prev: 'a dnode option ref, next: 'a dnode option ref }

fun new_node v = DNode { value = v, prev = ref NONE, next = ref NONE }

fun link (a, b) =
  let
    val DNode { next = na, ... } = a
    val DNode { prev = pb, ... } = b
  in
    na := SOME b;
    pb := SOME a
  end

datatype 'a dlist = DList of { head: 'a dnode option ref, tail: 'a dnode option ref }

fun new_dlist () = DList { head = ref NONE, tail = ref NONE }

fun push_back (DList { head, tail }, v) =
  let
    val n = new_node v
  in
    case !tail of
      NONE => (head := SOME n; tail := SOME n)
    | SOME t => (link (t, n); tail := SOME n)
  end

fun to_list_forward (DList { head, ... }) =
  let
    fun walk NONE = []
      | walk (SOME (DNode { value, next, ... })) = value :: walk (!next)
  in
    walk (!head)
  end

fun to_list_backward (DList { tail, ... }) =
  let
    fun walk NONE = []
      | walk (SOME (DNode { value, prev, ... })) = value :: walk (!prev)
  in
    walk (!tail)
  end

val dl = new_dlist ()
val () = app (fn x => push_back (dl, x)) [1, 2, 3, 4]
val () = print (String.concatWith " " (map Int.toString (to_list_forward dl)) ^ "\n")
val () = print (String.concatWith " " (map Int.toString (to_list_backward dl)) ^ "\n")
