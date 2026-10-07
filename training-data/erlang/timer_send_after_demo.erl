-module(timer_send_after_demo).
-export([run/0]).

run() ->
    {ok, _} = timer:send_after(50, self(), {tick, 1}),
    {ok, Ref} = timer:send_after(30, self(), {tick, cancelled}),
    {ok, cancel} = timer:cancel(Ref),
    receive
        {tick, N} -> io:format("tick ~p~n", [N])
    after 500 -> io:format("no tick~n")
    end,
    {Micros, Value} = timer:tc(fun() -> lists:sum(lists:seq(1, 1000)) end),
    io:format("~p ~p~n", [Value, is_integer(Micros)]).
