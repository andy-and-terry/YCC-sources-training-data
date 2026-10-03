type lfu_cache = { capacity : int; values : (int, int) Hashtbl.t; freqs : (int, int) Hashtbl.t }

let create capacity = { capacity; values = Hashtbl.create 16; freqs = Hashtbl.create 16 }

let evict cache =
  let min_key = ref (-1) in
  let min_freq = ref max_int in
  Hashtbl.iter
    (fun k f -> if f < !min_freq then begin min_freq := f; min_key := k end)
    cache.freqs;
  Hashtbl.remove cache.values !min_key;
  Hashtbl.remove cache.freqs !min_key

let put cache key value =
  if cache.capacity > 0 then begin
    if Hashtbl.mem cache.values key then begin
      Hashtbl.replace cache.values key value;
      Hashtbl.replace cache.freqs key (Hashtbl.find cache.freqs key + 1)
    end else begin
      if Hashtbl.length cache.values >= cache.capacity then evict cache;
      Hashtbl.replace cache.values key value;
      Hashtbl.replace cache.freqs key 1
    end
  end

let get cache key =
  match Hashtbl.find_opt cache.values key with
  | None -> -1
  | Some v ->
      Hashtbl.replace cache.freqs key (Hashtbl.find cache.freqs key + 1);
      v

let () =
  let cache = create 2 in
  put cache 1 10;
  put cache 2 20;
  ignore (get cache 1);
  put cache 3 30;
  Printf.printf "%d\n" (get cache 2);
  Printf.printf "%d\n" (get cache 1);
  Printf.printf "%d\n" (get cache 3)
