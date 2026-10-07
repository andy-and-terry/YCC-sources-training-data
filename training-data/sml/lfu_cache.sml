(* A simple LFU (least-frequently-used) cache backed by an
   association list of (key, value, frequency, last_used) tuples;
   capacity eviction removes the lowest-frequency entry, breaking
   ties by oldest last-used tick. Complements lru_cache.sml. *)
val tick = ref 0

fun make_cache () = ref ([]: (int * int * int * int) list)

fun touch (cache, key) =
  (tick := !tick + 1;
   cache :=
     map
       (fn (k, v, freq, used) => if k = key then (k, v, freq + 1, !tick) else (k, v, freq, used))
       (!cache))

fun get (cache, key) =
  case List.find (fn (k, _, _, _) => k = key) (!cache) of
    NONE => NONE
  | SOME (_, v, _, _) => (touch (cache, key); SOME v)

fun evict_one cache =
  case !cache of
    [] => ()
  | entries =>
      let
        val victim =
          List.foldl
            (fn (e as (_, _, freq, used), best as (_, _, bfreq, bused)) =>
              if freq < bfreq orelse (freq = bfreq andalso used < bused) then e else best)
            (hd entries)
            (tl entries)
        val (vk, _, _, _) = victim
      in
        cache := List.filter (fn (k, _, _, _) => k <> vk) (!cache)
      end

fun put (cache, capacity, key, value) =
  (tick := !tick + 1;
   cache := List.filter (fn (k, _, _, _) => k <> key) (!cache);
   if length (!cache) >= capacity then evict_one cache else ();
   cache := (key, value, 1, !tick) :: !cache)

val cache = make_cache ()
val () = put (cache, 2, 1, 10)
val () = put (cache, 2, 2, 20)
val () = print (Int.toString (getOpt (get (cache, 1), ~1)) ^ "\n")
val () = put (cache, 2, 3, 30) (* evicts key 2 (lower frequency) *)
val () = print (Int.toString (getOpt (get (cache, 2), ~1)) ^ "\n")
val () = print (Int.toString (getOpt (get (cache, 3), ~1)) ^ "\n")
