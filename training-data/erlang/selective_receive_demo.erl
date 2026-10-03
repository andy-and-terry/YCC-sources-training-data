-module(selective_receive_demo).
-export([run/0]).

%% Erlang's `receive` scans the mailbox for the first message matching one
%% of its clauses, skipping (but not discarding) anything that doesn't
%% match. That lets a process pick an "urgent" message out of order and
%% deal with everything else afterwards, in its original relative order.

run() ->
    self() ! {normal, 1},
    self() ! {normal, 2},
    self() ! {urgent, "fire"},
    self() ! {normal, 3},
    Urgent = receive
        {urgent, Msg} -> Msg
    end,
    Rest = drain(),
    {Urgent, Rest}.

drain() ->
    receive
        {normal, N} -> [N | drain()]
    after 0 ->
        []
    end.
