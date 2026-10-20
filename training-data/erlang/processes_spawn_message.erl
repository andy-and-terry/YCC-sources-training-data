-module(processes_spawn_message).
-export([main/0]).

worker(Parent, N) ->
    Parent ! {done, self(), N * N}.

main() ->
    Self = self(),
    Pids = [spawn(fun() -> worker(Self, N) end) || N <- [1, 2, 3, 4]],
    Results = [receive {done, P, R} -> R end || P <- Pids],
    io:format("~p~n", [lists:sum(Results)]),
    Pid = spawn(fun() -> receive stop -> ok after 50 -> timeout end end),
    Pid ! stop,
    timer:sleep(10),
    io:format("~p~n", [is_process_alive(Pid)]).
