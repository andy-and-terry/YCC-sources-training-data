-module(receive_after_timeout_selective).
-export([main/0]).

main() ->
    self() ! {low, 1},
    self() ! {high, 2},
    self() ! {low, 3},
    High = receive {high, X} -> X end,
    Low = receive {low, Y} -> Y end,
    io:format("~p ~p~n", [High, Low]),
    T = receive nothing -> got after 20 -> timeout end,
    io:format("~p~n", [T]),
    {messages, Rest} = process_info(self(), messages),
    io:format("~p~n", [Rest]),
    Ref = make_ref(),
    self() ! {Ref, ok},
    receive {Ref, R} -> io:format("~p~n", [R]) end.
