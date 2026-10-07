let
  # A purely functional FIFO queue built from two lists: `front` holds
  # elements in dequeue order, `back` holds recently enqueued elements
  # in reverse order. Amortized O(1) enqueue/dequeue.
  emptyQueue = { front = [ ]; back = [ ]; };

  enqueue = queue: x: queue // { back = [ x ] ++ queue.back; };

  normalize = queue:
    if queue.front == [ ] then { front = builtins.reverse queue.back; back = [ ]; }
    else queue;

  dequeue = queue:
    let q = normalize queue; in
    if q.front == [ ] then null
    else {
      value = builtins.head q.front;
      rest = q // { front = builtins.tail q.front; };
    };

  q0 = emptyQueue;
  q1 = enqueue q0 1;
  q2 = enqueue q1 2;
  q3 = enqueue q2 3;

  first = dequeue q3;
  second = dequeue first.rest;
  third = dequeue second.rest;
in
  {
    firstValue = first.value;
    secondValue = second.value;
    thirdValue = third.value;
  }
