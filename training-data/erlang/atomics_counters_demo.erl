-module(atomics_counters_demo).
-export([main/0]).

main() ->
    Atom = atomics:new(1, [{signed, false}]),
    Workers = 8,
    Per = 1000,
    Parent = self(),
    Pids = [spawn_link(fun() ->
                [atomics:add(Atom, 1, 1) || _ <- lists:seq(1, Per)],
                Parent ! {done, self()}
            end) || _ <- lists:seq(1, Workers)],
    [receive {done, P} -> ok end || P <- Pids],
    io:format("atomics total: ~p~n", [atomics:get(Atom, 1)]),
    io:format("exchange old: ~p~n", [atomics:exchange(Atom, 1, 5)]),
    io:format("cas: ~p~n", [atomics:compare_exchange(Atom, 1, 5, 6)]),
    Ctr = counters:new(2, [write_concurrency]),
    counters:add(Ctr, 1, 10),
    counters:sub(Ctr, 1, 3),
    counters:put(Ctr, 2, 99),
    io:format("counters: ~p ~p~n", [counters:get(Ctr, 1), counters:get(Ctr, 2)]).
