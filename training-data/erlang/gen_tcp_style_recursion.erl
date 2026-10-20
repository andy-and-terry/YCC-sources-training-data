-module(gen_tcp_style_recursion).
-export([main/0]).

loop(Acc) ->
    receive
        {add, N} -> loop(Acc + N);
        {get, From} -> From ! {total, Acc}, loop(Acc);
        stop -> ok
    end.

main() ->
    Pid = spawn(fun() -> loop(0) end),
    Pid ! {add, 4}, Pid ! {add, 6}, Pid ! {get, self()},
    receive {total, T} -> io:format("~p~n", [T]) end,
    Pid ! stop.
