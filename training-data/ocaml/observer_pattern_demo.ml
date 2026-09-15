type subject = { mutable observers : (float -> unit) list; mutable price : float }

let make_subject () = { observers = []; price = 0.0 }

let subscribe subject callback = subject.observers <- callback :: subject.observers

let notify_all subject = List.iter (fun callback -> callback subject.price) subject.observers

let set_price subject new_price =
  subject.price <- new_price;
  notify_all subject

let () =
  let ticker = make_subject () in
  subscribe ticker (fun price -> Printf.printf "logger: price is now %.2f\n" price);
  subscribe ticker (fun price ->
      if price > 100.0 then Printf.printf "alert: price crossed threshold at %.2f\n" price);
  set_price ticker 95.0;
  set_price ticker 105.0
