let
  insert = queue: value:
    if queue == [ ] then [ value ]
    else if value <= builtins.head queue then [ value ] ++ queue
    else [ (builtins.head queue) ] ++ insert (builtins.tail queue) value;

  popMin = queue: {
    min = builtins.head queue;
    rest = builtins.tail queue;
  };

  buildQueue = builtins.foldl' insert [ ];

  drain = queue:
    if queue == [ ] then [ ]
    else
      let popped = popMin queue;
      in [ popped.min ] ++ drain popped.rest;
in
  drain (buildQueue [ 5 3 8 1 9 2 ])
