signature ELEM = sig
  type t
  val toString : t -> string
end

signature TAGGED = sig
  type item
  type tagged
  val tag : int * item -> tagged
  val unwrap : tagged -> int * item
  val show : tagged -> string
end

functor MakeTagged (E : ELEM) :> TAGGED where type item = E.t = struct
  type item = E.t
  type tagged = int * item
  fun tag (n, x) = (n, x)
  fun unwrap t = t
  fun show (n, x) = "#" ^ Int.toString n ^ ":" ^ E.toString x
end

structure StringElem = struct
  type t = string
  fun toString s = s
end

structure TaggedString = MakeTagged (StringElem)

val t1 = TaggedString.tag (1, "hello")
val t2 = TaggedString.tag (2, "world")

val () = print (TaggedString.show t1 ^ "\n")
val () = print (TaggedString.show t2 ^ "\n")

val (n, s) = TaggedString.unwrap t1
val () = print (Int.toString n ^ " -> " ^ s ^ "\n")
