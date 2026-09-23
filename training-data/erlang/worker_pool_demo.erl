-module(worker_pool_demo).
-export([run/0, worker/0]).

%% Spawns a small fixed pool of worker processes and dispatches tasks
%% to them round-robin (rotating the worker list after each send),
%% then blocks in `collect/2` until every task has produced a result.

worker() ->
    receive
        {task, N, From} ->
            From ! {result, N * N},
            worker();
        stop ->
            ok
    end.

dispatch(_Workers, []) -> ok;
dispatch(Workers, [Task | Rest]) ->
    [Worker | Others] = Workers,
    Worker ! {task, Task, self()},
    dispatch(Others ++ [Worker], Rest).

collect(0, Acc) -> Acc;
collect(N, Acc) ->
    receive
        {result, R} -> collect(N - 1, [R | Acc])
    end.

run() ->
    Workers = [spawn(?MODULE, worker, []) || _ <- lists:seq(1, 3)],
    Tasks = lists:seq(1, 6),
    dispatch(Workers, Tasks),
    Results = collect(length(Tasks), []),
    lists:foreach(fun(W) -> W ! stop end, Workers),
    io:format("~p~n", [lists:sort(Results)]).
