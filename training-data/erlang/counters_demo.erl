-module(counters_demo).
-export([run/0]).

run() ->
    C = counters:new(2, [atomics]),
    Parent = self(),
    Pids = [spawn(fun() ->
                      [counters:add(C, 1, 1) || _ <- lists:seq(1, 100)],
                      Parent ! done
                  end) || _ <- lists:seq(1, 4)],
    [receive done -> ok end || _ <- Pids],
    io:format("~p~n", [counters:get(C, 1)]),
    counters:put(C, 2, 42),
    io:format("~p~n", [counters:get(C, 2)]).
